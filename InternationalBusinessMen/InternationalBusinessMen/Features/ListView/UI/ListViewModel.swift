//
//  ListViewModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

class ListViewModel: ObservableObject {
    private let getConversionRatesUseCase: GetConversionRatesUseCase
    private let getTransactionsUseCase: GetTransactionsUseCase
    @Published var tradesList: [TransactionModel] = []
    init() {
        getConversionRatesUseCase = ListViewProvider.getConversionRates
        getTransactionsUseCase = ListViewProvider.getTransactions
        onViewAppeared()
    }
    
    // MARK: Screen Events
    func onViewAppeared() {
        Task {
            await loadTransactions()
        }
    }
    
    // MARK: API call
    private func loadConversionRates() async {
        do {
            let conversionRates = try await getConversionRatesUseCase.invoke()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    private func loadTransactions() async {
        do {
            let transactionList = try await getTransactionsUseCase.invoke()
            print(transactionList)
            await MainActor.run {
                self.tradesList = transactionList
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
