//
//  ConversionAPIModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct ConversionAPIModel: Codable {
    let from: String
    let to: String
    let rate: Double
}

typealias ConversionList = [ConversionAPIModel]
