//
//  ListViewDataSourceImpl.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

class ListViewDataSourceImpl: ListViewDataSource {
    private let API: API
    
    init(_ API: API) {
        self.API = API
    }
    
    func getTransactions() async throws -> [TransactionModel] {
        try await API.getTransactions().map { TransactionModel(transactionModelResponse: $0) }
    }
}
