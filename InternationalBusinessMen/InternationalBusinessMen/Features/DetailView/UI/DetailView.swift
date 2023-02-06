//
//  DetailView.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ErrorSectionView(content: {
            if viewModel.state == .loading {
                ProgressView()
                    .scaleEffect(2)
            } else {
                section
            }
        }, errorManager: viewModel)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var section: some View {
        List() {
            Text("\(Localized.sku.text): \(viewModel.groupedTransaction.sku)")
                .font(.title)
                .padding(.bottom, 10)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(Localized.amount.text): ")
                        .font(.headline)
                    ForEach(viewModel.groupedTransaction.currenciesAmounts, id: \.amount) { currencyAmount in
                        Text("\(currencyAmount.amount, specifier: "%.2f") \(currencyAmount.currency.rawValue)")
                    }
                    Spacer()
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("\(Localized.rateConversion.text): ")
                        .font(.headline)
                    ForEach(Array(viewModel.groupedTransaction.exchangeAmount.keys), id: \.self) { currency in
                        HStack(spacing: 10) {
                            Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.exchangeRate ?? 0, specifier: "%.2f") -")
                            Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.convertedAmount ?? 0, specifier: "%.2f") \(Currency.EUR.rawValue)")
                        }
                    }
                    Text("\(Localized.total.text): \(viewModel.totalPrice, specifier: "%.2f") \(Currency.EUR.rawValue)")
                        .font(.headline)
                    Spacer()
                }
            }
        }
        .listStyle(.inset)
    }
    
    private func groupedTransactionCoulmn(consultInfo: Double) -> some View {
        ForEach(Array(viewModel.groupedTransaction.exchangeAmount.keys), id: \.self) { currency in
            HStack(spacing: 10) {
                Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.exchangeRate ?? 0, specifier: "%.2f") -")
                Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.convertedAmount ?? 0, specifier: "%.2f") \(Currency.EUR.rawValue)")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewProvider.detailView(groupedTransaction: GroupedTransactionModel(id: UUID(),
                                                                                  sku: "",
                                                                                  count: 0,
                                                                                  currenciesAmounts: [],
                                                                                  exchangeAmount: [:]),
                                      coordinator: MainCoordinator.fakeCoordinator)
    }
}
