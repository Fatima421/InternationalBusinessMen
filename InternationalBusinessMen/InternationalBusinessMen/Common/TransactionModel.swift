//
//  TransactionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct TransactionModel: Identifiable {
    var id: String
    var sku: String
    var amount: Double
    var currency: String
}

extension TransactionModel {
    init(transactionModelResponse: TransactionAPIModel) {
        self.id = transactionModelResponse.sku
        self.sku = transactionModelResponse.sku
        self.amount = transactionModelResponse.amount
        self.currency = transactionModelResponse.currency
    }
}
