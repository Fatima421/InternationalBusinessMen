//
//  DetailViewProvider.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import Foundation

final class DetailViewProvider {
    static let API: API = IBMAPI()
    static let detailViewDataSource = DetailViewDataSourceImpl(API)
    static let getConversionRates = GetConversionRatesUseCaseImpl(dataSource: detailViewDataSource)
    
    static func detailViewModel(groupedTransaction: GroupedTransactionModel, coordinator: FlowCoordinator) -> DetailViewModel {
        DetailViewModel(groupedTransaction: groupedTransaction, getConversionRatesUseCase: getConversionRates, coordinator: coordinator)
    }
    
    static func detailView(groupedTransaction: GroupedTransactionModel, coordinator: FlowCoordinator) -> DetailView {
        DetailView(viewModel: detailViewModel(groupedTransaction: groupedTransaction, coordinator: coordinator))
    }
}
