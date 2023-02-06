//
//  ConversionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct ConversionModel {
    var from: Currency
    var to: Currency
    var rate: Double
}

extension ConversionModel {
    init(conversionModelResponse: ConversionAPIModel) {
        self.from = Currency(rawValue: conversionModelResponse.from) ?? .EUR
        self.to = Currency(rawValue: conversionModelResponse.to) ?? .EUR
        self.rate = conversionModelResponse.rate
    }  
}
