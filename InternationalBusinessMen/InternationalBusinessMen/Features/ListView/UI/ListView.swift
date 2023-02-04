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
        NavigationView {
            VStack(alignment: .trailing) {
                Text("Elements: \(viewModel.tradesList.count)")
                List {
                    ForEach(viewModel.tradesList) { trade in
                        HStack {
                            Text("SKU: \(trade.sku)")
                            Spacer()
                            Text("Total: \(10.0)")
                        }
                    }
                }
                .navigationTitle("Trade List")
                .listStyle(.inset)
            }
            .padding(.horizontal)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView()
    }
}
