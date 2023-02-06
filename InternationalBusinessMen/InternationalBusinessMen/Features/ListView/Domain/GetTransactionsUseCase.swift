//
//  GetTransactionsUseCase.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

protocol GetTransactionsUseCase {
    func invoke() async throws -> [TransactionModel]
}

class GetTransactionsUseCaseImpl: GetTransactionsUseCase {
    private let dataSource: ListViewDataSource

    init(dataSource: ListViewDataSource) {
        self.dataSource = dataSource
    }

    func invoke() async throws -> [TransactionModel] {
        try await dataSource.getTransactions()
    }
}
