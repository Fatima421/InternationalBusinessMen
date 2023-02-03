//
//  RestManagerAsync.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

class RestManagerAsync {
    func sendRequest<T: Codable>(url: String, responseModel: T.Type) async -> Result<T, RestError> {
        guard let url = URL(string: url) else { return .failure(.badURL) }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // TODO: check internet?
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { return .failure(.badResponse) }
            
            switch response.statusCode {
            case 200:
                guard let decodeResponse = try? JSONDecoder().decode(responseModel, from: data) else { return .failure(.jsonParsingError(T.self)) }
                return .success(decodeResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.network(response.statusCode))
            }
        } catch {
            return .failure(.badResponse)
        }
    }
}
