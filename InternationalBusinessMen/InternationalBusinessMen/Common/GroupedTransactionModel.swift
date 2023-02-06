//
//  GroupedTransactionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 5/2/23.
//

import Foundation

struct GroupedTransactionModel: Identifiable {
    var id: UUID
    var sku: String
    var count: Int
    var currenciesAmounts: [(currency: Currency, amount: Double)]
    var exchangeAmount: [Currency: CurrencyExchange] = [:]
}

struct CurrencyExchange {
    var exchangeRate: Double
    var convertedAmount: Double
}
