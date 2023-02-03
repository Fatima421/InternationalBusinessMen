//
//  ConversionModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

struct ConversionModel {
    var from: String
    var to: String
    var rate: Double
}

extension ConversionModel {
    init(conversionModelResponse: ConversionAPIModel) {
        self.from = conversionModelResponse.from
        self.to = conversionModelResponse.to
        self.rate = conversionModelResponse.rate
    }  
}
