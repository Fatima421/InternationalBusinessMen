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
        VStack(alignment: .trailing, spacing: 10) {
            HStack {
                Text("\(Localized.totalElements.text): \(viewModel.tradeList.count)")
                    .fontWeight(.bold)
                Spacer()
                Text("\(Localized.groupedElements.text): \(viewModel.groupedTransactions.count)")
                    .fontWeight(.bold)
            }
            .foregroundColor(Asset.gray.color)
            .padding(.horizontal, 25)
            .padding(.top)
            
            List {
                ForEach(viewModel.groupedTransactions) { transaction in
                    HStack {
                        Text("\(Localized.product.text) \(transaction.sku)")
                            .font(.title3)
                        Spacer()
                        Image(systemName: SystemIcons.rightArrow.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Asset.gray.color)
                    }
                    .onTapGesture {
                        viewModel.goToDetailView(transaction)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle(Localized.listViewTitle.text)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewProvider.listView(coordinator: MainCoordinator.fakeCoordinator)
    }
}
