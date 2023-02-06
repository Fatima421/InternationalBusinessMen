//
//  DetailDataSource.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 5/2/23.
//

import Foundation

protocol DetailDataSource {
    func getConversionRates() async throws -> [ConversionModel]
}
