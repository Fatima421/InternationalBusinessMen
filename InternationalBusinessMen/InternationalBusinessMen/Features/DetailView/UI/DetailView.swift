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
        List {
            Text("SKU: \(viewModel.groupedTransaction.sku)")
                .font(.title)
                .padding(.bottom, 10)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Amount: ")
                        .font(.headline)
                    ForEach(viewModel.groupedTransaction.currenciesAmounts, id: \.amount) { currencyAmount in
                        Text("\(currencyAmount.amount, specifier: "%.2f") \(currencyAmount.currency.rawValue)")
                    }
                    Spacer()
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Rate & Conversion: ")
                        .font(.headline)
                    ForEach(Array(viewModel.groupedTransaction.exchangeAmount.keys), id: \.self) { currency in
                        HStack(spacing: 10) {
                            Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.exchangeRate ?? 0, specifier: "%.2f")")
                            Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.convertedAmount ?? 0, specifier: "%.2f") EUR")
                        }
                    }
                    Text("Total: \(viewModel.totalPrice, specifier: "%.2f") EUR")
                        .font(.headline)
                    Spacer()
                }
            }

        }
        .listStyle(.inset)
        .padding()
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
