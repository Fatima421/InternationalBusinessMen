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
            HStack {
                Text("Total Elements: \(viewModel.tradeList.count)")
                Spacer()
                Text("Grouped Elements: \(viewModel.groupedTransactions.count)")
            }
            List {
                ForEach(viewModel.groupedTransactions) { transaction in
                    HStack {
                        Text("SKU: \(transaction.sku)")
                        Spacer()
                    }
                    .onTapGesture {
                        viewModel.goToDetailView(transaction)
                    }
                }
            }
            .listStyle(.inset)
        }
        .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView(coordinator: MainCoordinator.fakeCoordinator)
    }
}
