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
    static let getTransactions = GetTransactionsUseCaseImpl(dataSource: listViewDataSource)
    
    static func listViewModel(_ coordinator: FlowCoordinator) -> ListViewModel {
        ListViewModel(getTransactionsUseCase: getTransactions, coordinator: coordinator)
    }
    
    static func listView(coordinator: FlowCoordinator) -> ListView {
        ListView(viewModel: listViewModel(coordinator))
    }
}
