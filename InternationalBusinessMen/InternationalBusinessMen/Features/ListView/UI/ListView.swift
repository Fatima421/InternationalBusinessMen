//
//  ListView.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Elements: \(viewModel.tradeList.count)")
            List {
                ForEach(viewModel.tradeList) { trade in
                    HStack {
                        Text("SKU: \(trade.sku)")
                        Spacer()
                        Text("Amount: \(trade.amount, specifier: "%.2f") \(trade.currency.rawValue)")
                    }
                    .onTapGesture {
                        viewModel.goToDetailView()
                    }
                }
            }
            .navigationTitle("Trade List")
            .listStyle(.inset)
        }
        .padding(.horizontal)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView(coordinator: MainCoordinator.fakeCoordinator)
    }
}
