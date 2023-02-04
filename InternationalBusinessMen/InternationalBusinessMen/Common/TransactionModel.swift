//
//  TransactionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct TransactionModel: Identifiable {
    var id: UUID
    var sku: String
    var amount: Double
    var currency: String
}

extension TransactionModel {
    init(transactionModelResponse: TransactionAPIModel) {
        self.id = UUID()
        self.sku = transactionModelResponse.sku
        self.amount = transactionModelResponse.amount
        self.currency = transactionModelResponse.currency
    }
}
