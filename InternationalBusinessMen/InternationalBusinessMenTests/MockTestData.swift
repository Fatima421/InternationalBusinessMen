//
//  MockTestData.swift
//  InternationalBusinessMenTests
//
//  Created by Fatima Sahar on 6/2/23.
//

import Foundation
@testable import InternationalBusinessMen

class MockTestData {
    var listViewModel: ListViewModel = ListViewProvider.listViewModel(MainCoordinator.fakeCoordinator)
    var detailViewModel: DetailViewModel = DetailViewProvider.detailViewModel(groupedTransaction: GroupedTransactionModel(id: UUID(),
                                                                                                                          sku: "A",
                                                                                                                          count: 2,
                                                                                                                          currenciesAmounts: []),
                                                                              coordinator: MainCoordinator.fakeCoordinator)
    let groupedTransaction = GroupedTransactionModel(id: UUID(), sku: "A",
                                                     count: 2,
                                                     currenciesAmounts: [(currency: .USD, amount: 10.0),
                                                                         (currency: .GBP, amount: 20.0),
                                                                         (currency: .EUR, amount: 30.0)])
    let tradeList = [TransactionModel(id: UUID(), sku: "A", amount: 10.0, currency: .USD),
                     TransactionModel(id: UUID(), sku: "A", amount: 15.0, currency: .EUR),
                     TransactionModel(id: UUID(), sku: "B", amount: 20.0, currency: .AUD),
                     TransactionModel(id: UUID(), sku: "C", amount: 25.0, currency: .SEK),
                     TransactionModel(id: UUID(), sku: "C", amount: 30.0, currency: .INR)]
}
