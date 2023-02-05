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
    
    static func detailViewModel(tradeList: [TransactionModel], coordinator: FlowCoordinator) -> DetailViewModel {
        DetailViewModel(tradeList: tradeList, getConversionRatesUseCase: getConversionRates, coordinator: coordinator)
    }
    
    static func detailView(tradeList: [TransactionModel], coordinator: FlowCoordinator) -> DetailView {
        DetailView(viewModel: detailViewModel(tradeList: tradeList, coordinator: coordinator))
    }
}
