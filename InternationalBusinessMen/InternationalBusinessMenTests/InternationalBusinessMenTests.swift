//
//  InternationalBusinessMenTests.swift
//  InternationalBusinessMenTests
//
//  Created by Fatima Sahar on 3/2/23.
//

import XCTest
@testable import InternationalBusinessMen

final class InternationalBusinessMenTests: XCTestCase {
    
    let mockData = MockTestData()
    var listViewModel: ListViewModel = MockTestData().listViewModel
    var detailViewModel: DetailViewModel = MockTestData().detailViewModel
    
    override func setUp() async throws {
        listViewModel.tradeList = mockData.tradeList
        detailViewModel.groupedTransaction = mockData.groupedTransaction
    }
    
    func testGroupTransactionsBySKU() {
        listViewModel.groupTransactionsBySKU()

        XCTAssertEqual(listViewModel.groupedTransactions.count, 3)
        
        let groupedTransactionA = listViewModel.groupedTransactions.first(where: { $0.sku == "A" })
        XCTAssertNotNil(groupedTransactionA)
        XCTAssertEqual(groupedTransactionA?.count, 2)
        XCTAssertEqual(groupedTransactionA?.currenciesAmounts.count, 2)
        
        let groupedTransactionB = listViewModel.groupedTransactions.first(where: { $0.sku == "B" })
        XCTAssertNotNil(groupedTransactionB)
        XCTAssertEqual(groupedTransactionB?.count, 1)
        XCTAssertEqual(groupedTransactionB?.currenciesAmounts.count, 1)
        
        let groupedTransactionC = listViewModel.groupedTransactions.first(where: { $0.sku == "C" })
        XCTAssertNotNil(groupedTransactionC)
        XCTAssertEqual(groupedTransactionC?.count, 2)
        XCTAssertEqual(groupedTransactionC?.currenciesAmounts.count, 2)
    }
    
    func testGetAmountConverted() {
        let fromCurrency = Currency.USD
        let toCurrency = Currency.EUR
        let amount = 10.0
        
        let convertedAmount = detailViewModel.getAmountConverted(from: fromCurrency, to: toCurrency, amount: amount)
        XCTAssertNotNil(convertedAmount, "Converted amount should not be nil")

        let expectedConvertedAmount = detailViewModel.getConversionRate(from: fromCurrency, to: toCurrency) ?? 0 * amount
        XCTAssertEqual(convertedAmount, expectedConvertedAmount, "Converted amount should match expected value")
    }
    
    @MainActor
    func testCurrencyConversion() {
        let expectedExchangeAmounts: [Double: CurrencyExchange] = [
            10.0: CurrencyExchange(exchangeRate: detailViewModel.getConversionRate(from: .USD, to: .EUR) ?? 0,
                                   convertedAmount: detailViewModel.getAmountConverted(from: .USD, to: .EUR, amount: 10.0)),
            
            20.0: CurrencyExchange(exchangeRate: detailViewModel.getConversionRate(from: .GBP, to: .EUR) ?? 0,
                                   convertedAmount: detailViewModel.getAmountConverted(from: .GBP, to: .EUR, amount: 20.0)),
            
            30.0: CurrencyExchange(exchangeRate: 1.0,
                                   convertedAmount: 30.0)
        ]
        
        detailViewModel.currencyConversion()
        
        XCTAssertEqual(detailViewModel.groupedTransaction.exchangeAmount, expectedExchangeAmounts)
        XCTAssertEqual(detailViewModel.totalPrice, expectedExchangeAmounts.values.reduce(0, { $0 + $1.convertedAmount }))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
