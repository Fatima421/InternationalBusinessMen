//
//  GetConversionRatesUseCase.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

protocol GetConversionRatesUseCase {
    func invoke() async throws -> [ConversionModel]
}

class GetConversionRatesUseCaseImpl: GetConversionRatesUseCase {
    private let dataSource: DetailDataSource

    init(dataSource: DetailDataSource) {
        self.dataSource = dataSource
    }

    func invoke() async throws -> [ConversionModel] {
        try await dataSource.getConversionRates()
    }
}
