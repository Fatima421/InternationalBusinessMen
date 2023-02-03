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
        LazyVStack {
            ForEach(viewModel.tradesList) { trade in
                Text(trade.sku)
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.onViewAppeared()
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView()
    }
}
