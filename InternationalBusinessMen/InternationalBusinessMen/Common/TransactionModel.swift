//
//  TransactionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation
import SwiftUI

struct TransactionModel: Identifiable, Hashable {
    var id: UUID
    var sku: String
    var amount: Double
    var currency: Currency
    var totalPrice: Double = 0
}

extension TransactionModel {
    init(transactionModelResponse: TransactionAPIModel) {
        self.id = UUID()
        self.sku = transactionModelResponse.sku
        self.amount = transactionModelResponse.amount
        self.currency = Currency(rawValue: transactionModelResponse.currency) ?? .EUR
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(sku)
    }
    
    static func == (lhs: TransactionModel, rhs: TransactionModel) -> Bool {
        return lhs.sku == rhs.sku
    }
}
