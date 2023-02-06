//
//  CurrencyExchange.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 6/2/23.
//

import Foundation

struct CurrencyExchange {
    var exchangeRate: Double
    var convertedAmount: Double
}

extension CurrencyExchange: Equatable {
    static func == (lhs: CurrencyExchange, rhs: CurrencyExchange) -> Bool {
        return lhs.exchangeRate == rhs.exchangeRate && lhs.convertedAmount == rhs.convertedAmount
    }
}
