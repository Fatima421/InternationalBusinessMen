//
//  ListViewModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

class ListViewModel: ViewModelCoordinator, ObservableObject {
    private let getConversionRatesUseCase: GetConversionRatesUseCase
    private let getTransactionsUseCase: GetTransactionsUseCase
    @Published var tradesList: [TransactionModel] = []
    @Published private var conversionList: [ConversionModel] = []
    
    @Published var totalPrice: String = ""
    
    var currencyRateDict = [String: [String: Double]]()
    
    required init(coordinator: FlowCoordinator) {
        getConversionRatesUseCase = ListViewProvider.getConversionRates
        getTransactionsUseCase = ListViewProvider.getTransactions
        
        super.init()
        self.onViewAppeared()
    }

    required init() {
        fatalError("init() has not been implemented")
    }
    
    // MARK: Screen Events
    func onViewAppeared() {
        Task {
            await loadTransactions()
            await loadConversionRates()
        }
    }
    
    // MARK: API call
    private func loadConversionRates() async {
        do {
            let conversionRates = try await getConversionRatesUseCase.invoke()
            await MainActor.run {
                self.conversionList = conversionRates
            }
            await self.currencyConversion()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    private func loadTransactions() async {
        do {
            let transactionList = try await getTransactionsUseCase.invoke()
            await MainActor.run {
                self.tradesList = transactionList
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    // MARK: Conversions
    @MainActor
    private func currencyConversion() {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        tradesList.indices.forEach { index in
            tradesList[index].totalPrice = getAmountConverted(from: tradesList[index].currency, to: .EUR, amount: tradesList[index].amount)
            self.totalPrice = formatter.string(from: tradesList[index].totalPrice as NSNumber) ?? ""
        }
    }
    
    private func getAmountConverted(from: Currency, to: Currency, amount: Double) -> Double {
        guard let rate = getConversionRate(from: from, to: to) else { return 0 }
        return amount * rate
    }

    func getConversionRate(from: Currency, to: Currency) -> Double? {
        if from == to {
            return 1.0
        }
        for exchangeRate in conversionList {
            if exchangeRate.from == from {
                if let intermediateRate = getConversionRate(from: exchangeRate.to, to: to) {
                    return exchangeRate.rate * intermediateRate
                }
            }
        }
        return nil
    }
    
    // MARK: Navigation
    func goToDetailView() {
        coordinator.goToDetailView()
    }
}
