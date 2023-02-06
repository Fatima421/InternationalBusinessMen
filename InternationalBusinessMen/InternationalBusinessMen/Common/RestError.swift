//
//  RestError.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

public enum RestError: Error {
    case generic
    case noInternet
    case network(_ code: Int)
    case badURL
    case badResponse
    case emptyData
    case jsonParsingError(Any.Type)
    case unauthorized
}

extension RestError: Equatable {
    public static func == (lhs: RestError, rhs: RestError) -> Bool {
        switch (lhs, rhs) {
        case (.generic, .generic),
            (.noInternet, .noInternet),
            (.badURL, .badURL),
            (.badResponse, .badResponse),
            (.emptyData, .emptyData),
            (.unauthorized, .unauthorized):
            return true
        case (.network(let lhsCode), .network(let rhsCode)):
            return lhsCode == rhsCode
        case (.jsonParsingError(let lhsType), .jsonParsingError(let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
}
