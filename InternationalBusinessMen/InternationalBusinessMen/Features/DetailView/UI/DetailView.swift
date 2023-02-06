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
                .fontWeight(.bold)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(Localized.amount.text)
                        .font(.headline)
                    ForEach(viewModel.groupedTransaction.currenciesAmounts, id: \.amount) { currencyAmount in
                        Text("\(currencyAmount.amount, specifier: "%.2f") \(currencyAmount.currency.rawValue)")
                    }
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    HStack {
                        Spacer()
                        groupedTransactionCoulmn(showRate: true, headline: Localized.rate.text)
                        Spacer()
                        groupedTransactionCoulmn(showRate: false, headline: Localized.conversion.text)
                    }
                }
            }
            .padding(.top)
            Text("\(Localized.total.text) \(viewModel.totalPrice, specifier: "%.2f") \(Currency.EUR.rawValue)")
                .font(.headline)
        }
        .listStyle(.inset)
    }
    
    private func groupedTransactionCoulmn(showRate: Bool, headline: String) -> some View {
        VStack(spacing: 10) {
            Text(headline)
                .font(.headline)
            ForEach(Array(viewModel.groupedTransaction.exchangeAmount.keys), id: \.self) { currency in
                if showRate {
                    Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.exchangeRate ?? 0, specifier: "%.2f")")
                } else {
                    Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.convertedAmount ?? 0, specifier: "%.2f") \(Currency.EUR.rawValue)")
                }
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
