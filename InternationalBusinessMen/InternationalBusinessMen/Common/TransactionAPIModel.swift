//
//  TransactionAPIModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct TransactionAPIModel: Codable {
    let sku: String
    let amount: Double
    let currency: String
}

typealias TransactionList = [TransactionAPIModel]
