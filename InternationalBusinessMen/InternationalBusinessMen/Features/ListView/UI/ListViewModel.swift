//
//  ListViewModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

class ListViewModel: ViewModelCoordinator, ObservableObject {
    private let getTransactionsUseCase: GetTransactionsUseCase
    @Published var tradeList: [TransactionModel] = []
    private var reducedList: [TransactionModel: Int] = [:]
    @Published var groupedTransactions: [GroupedTransactionModel] = []
    
    init(getTransactionsUseCase: GetTransactionsUseCase, coordinator: FlowCoordinator) {
        self.getTransactionsUseCase = getTransactionsUseCase
        
        super.init()
        self.coordinator = coordinator
        self.onViewAppeared()
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    // MARK: Screen Events
    func onViewAppeared() {
        Task {
            await loadTransactions()
            
        }
    }
    
    // MARK: API call
    private func loadTransactions() async {
        do {
            let transactionList = try await getTransactionsUseCase.invoke()
            await MainActor.run {
                self.tradeList = transactionList
                self.groupTransactionsBySKU()
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    func groupTransactionsBySKU() {
        var result = [String: GroupedTransactionModel]()
        for transaction in tradeList {
            if result[transaction.sku] == nil {
                result[transaction.sku] = GroupedTransactionModel(id: UUID(),
                                                                  sku: transaction.sku,
                                                                  count: 1,
                                                                  currenciesAmounts: [(transaction.currency, transaction.amount)])
            } else {
                result[transaction.sku]?.count += 1
                result[transaction.sku]?.currenciesAmounts.append((transaction.currency, transaction.amount))
            }
        }
        self.groupedTransactions = Array(result.values)
    }
    
    // MARK: Navigation
    func goToDetailView(_ groupedTransaction: GroupedTransactionModel) {
        coordinator.goToDetailView(groupedTransaction: groupedTransaction)
    }
}
