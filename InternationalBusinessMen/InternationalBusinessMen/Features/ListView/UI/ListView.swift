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
        VStack(alignment: .trailing) {
            HStack {
                Text("\(Localized.totalElements.text): \(viewModel.tradeList.count)")
                Spacer()
                Text("\(Localized.groupedElements.text): \(viewModel.groupedTransactions.count)")
            }
            .padding()
            List {
                ForEach(viewModel.groupedTransactions) { transaction in
                    HStack {
                        Text("\(Localized.sku.text): \(transaction.sku)")
                        Spacer()
                    }
                    .onTapGesture {
                        viewModel.goToDetailView(transaction)
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView(coordinator: MainCoordinator.fakeCoordinator)
    }
}
