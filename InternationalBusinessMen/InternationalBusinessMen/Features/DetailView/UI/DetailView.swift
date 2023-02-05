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
        Text("Products with this SKU: ")
        ForEach(viewModel.tradeList) { trade in
            Text(trade.sku)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewProvider.detailView(tradeList: [],
                                      coordinator: MainCoordinator.fakeCoordinator)
    }
}
