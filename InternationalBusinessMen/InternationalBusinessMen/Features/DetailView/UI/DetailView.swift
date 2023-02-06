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
        VStack {
            List {
                Text("SKU: \(viewModel.groupedTransaction.sku)")
                    .font(.title)
                Text("Amount: ")
                    .font(.headline)
                ForEach(viewModel.groupedTransaction.currenciesAmounts, id: \.amount) { currencyAmount in
                    Text("\(currencyAmount.amount, specifier: "%.2f") \(currencyAmount.currency.rawValue)")
                }
                ForEach(Array(viewModel.groupedTransaction.exchangeAmount.keys), id: \.self) { currency in
                    HStack {
                        Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.exchangeRate ?? 0, specifier: "%.2f")")
                        Text("\(viewModel.groupedTransaction.exchangeAmount[currency]?.convertedAmount ?? 0, specifier: "%.2f") EUR")
                    }
                }
                Text("Total: \(viewModel.totalPrice, specifier: "%.2f") EUR")
            }
            .listStyle(.inset)
        }.padding()
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
