//
//  ListViewProvider.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

final class ListViewProvider {
    static let API: API = IBMAPI()
    static let listViewDataSource = ListViewDataSourceImpl(API)
    static let getConversionRates = GetConversionRatesUseCaseImpl(dataSource: listViewDataSource)
    static let getTransactions = GetTransactionsUseCaseImpl(dataSource: listViewDataSource)
    
    static func listViewModel() -> ListViewModel {
        ListViewModel()
    }
    
    static func listView() -> ListView {
        ListView(viewModel: listViewModel())
    }
}
