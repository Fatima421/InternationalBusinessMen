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
            Text("Elements: \(viewModel.tradesList.count)")
            List {
                ForEach(viewModel.tradesList) { trade in
                    HStack {
                        Text("SKU: \(trade.sku)")
                        Spacer()
                        Text("Total: \(trade.totalPrice)€")
                    }
                    .onTapGesture {
                        print("pasa por aqui \(trade.sku)")
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
