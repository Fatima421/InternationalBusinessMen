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
            groupTransactionBySKU()
        }
    }
    
    // MARK: API call
    private func loadTransactions() async {
        do {
            let transactionList = try await getTransactionsUseCase.invoke()
            await MainActor.run {
                self.tradeList = transactionList
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func groupTransactionBySKU() -> [GroupedTransactionModel] {
        var groupedTransactions = [String: GroupedTransactionModel]()
        
        for transaction in tradeList {
            if groupedTransactions[transaction.sku] == nil {
                groupedTransactions[transaction.sku] = GroupedTransactionModel(sku: transaction.sku, count: 1, currencies: [transaction.currency], amount: [transaction.amount])
            } else {
                var existingTransaction = groupedTransactions[transaction.sku]
                existingTransaction?.count += 1
                existingTransaction?.currencies.append(transaction.currency)
                existingTransaction?.amount.append(transaction.amount)
                groupedTransactions[transaction.sku] = existingTransaction
            }
        }
        
        return Array(groupedTransactions.values)
    }
//    private func removeDuplicates() {
//        var uniqueTradeList: [TransactionModel] = []
//
//        for transaction in tradeList {
//            reducedList[transaction, default: 0] += 1
//        }
//
//        for (transaction, count) in reducedList {
//            var uniqueTransaction = transaction
//            uniqueTransaction.quantity = [transaction: count]
//            print(uniqueTransaction.quantity)
//            uniqueTradeList.append(uniqueTransaction)
//        }
//        self.tradeList = uniqueTradeList
//    }
    
    // MARK: Navigation
    func goToDetailView() {
        coordinator.goToDetailView(tradeList: tradeList)
    }
}
