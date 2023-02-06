//
//  DetailViewModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 5/2/23.
//

import Foundation

class DetailViewModel: ViewModelCoordinator, ObservableObject {
    @Published var groupedTransaction: GroupedTransactionModel
    @Published private var conversionList: [ConversionModel] = []
    private let getConversionRatesUseCase: GetConversionRatesUseCase
    @Published var totalPrice: Double = 0.00

    
    init(groupedTransaction: GroupedTransactionModel,
         getConversionRatesUseCase: GetConversionRatesUseCase,
         coordinator: FlowCoordinator) {
        self.groupedTransaction = groupedTransaction
        self.getConversionRatesUseCase = getConversionRatesUseCase
        
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
    
    // MARK: Conversions
    @MainActor
    private func currencyConversion() {
        for amount in groupedTransaction.currenciesAmounts {
            let convertedAmount = getAmountConverted(from: amount.currency, to: .EUR, amount: amount.amount)
            let conversionRate = getConversionRate(from: amount.currency, to: .EUR) ?? 0
            totalPrice += convertedAmount
            groupedTransaction.exchangeAmount[amount.currency] = CurrencyExchange(exchangeRate: conversionRate, convertedAmount: convertedAmount)
        }
        totalPrice = totalPrice.rounded(.toNearestOrAwayFromZero)
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
}
