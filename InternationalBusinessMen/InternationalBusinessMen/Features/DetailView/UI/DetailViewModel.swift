//
//  DetailViewModel.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 5/2/23.
//

import Foundation

class DetailViewModel: ViewModelCoordinator, ObservableObject {
    @Published var tradeList: [GroupedTransactionModel]
    @Published private var conversionList: [ConversionModel] = []
    private let getConversionRatesUseCase: GetConversionRatesUseCase
    @Published var totalPrice: Double = 0.00

    
    init(tradeList: [GroupedTransactionModel],
         getConversionRatesUseCase: GetConversionRatesUseCase,
         coordinator: FlowCoordinator) {
        self.tradeList = tradeList
        self.getConversionRatesUseCase = getConversionRatesUseCase
        
        super.init()
        self.coordinator = coordinator
    }
    
    required init() {
        fatalError("init() has not been implemented")
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
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        tradeList.indices.forEach { index in
            tradeList[index].totalPrice = getAmountConverted(from: tradeList[index].currency,
                                                             to: .EUR,
                                                             amount: tradeList[index].amount)
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
}
