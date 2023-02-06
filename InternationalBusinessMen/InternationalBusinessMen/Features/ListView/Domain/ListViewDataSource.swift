//
//  ListViewDataSource.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

protocol ListViewDataSource {
    func getTransactions() async throws -> [TransactionModel]
}
