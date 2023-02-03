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
