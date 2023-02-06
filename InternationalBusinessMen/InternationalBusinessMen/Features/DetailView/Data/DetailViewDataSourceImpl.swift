//
//  DetailViewDataSourceImpl.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 5/2/23.
//

import Foundation


class DetailViewDataSourceImpl: DetailDataSource {
    private let API: API
    
    init(_ API: API) {
        self.API = API
    }
    
    func getConversionRates() async throws -> [ConversionModel] {
        try await API.getConversionRates().map { ConversionModel(conversionModelResponse: $0) }
    }
}
