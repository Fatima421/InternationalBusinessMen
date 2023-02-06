//
//  MainCoordinator.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import SwiftUI
import UIKit

final class MainCoordinator: FlowCoordinator, ObservableObject {
    
    private var navigation: UINavigationController
    
    static var fakeCoordinator: MainCoordinator {
        return MainCoordinator(navigation: UINavigationController())
    }
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    // MARK: UINavigationController
    func getMainListFlow() -> UINavigationController {
        let viewController = UIHostingController(rootView: ListViewProvider.listView(coordinator: self))
        navigation = UINavigationController(rootViewController: viewController)
        customizeNavigationTitle(title: Localized.listViewTitle.text)
        return navigation
    }
    
    // MARK: Navigation
    func goToDetailView(groupedTransaction: GroupedTransactionModel) {
        let viewController = UIHostingController(rootView: DetailViewProvider.detailView(groupedTransaction: groupedTransaction,
                                                                                         coordinator: self))
        viewController.navigationItem.title = Localized.detailViewTitle.text
        navigation.pushViewController(viewController, animated: true)
    }
    
    // MARK: Navigation Title
    private func customizeNavigationTitle(title: String?) {
        navigation.navigationBar.prefersLargeTitles = true
        navigation.navigationItem.largeTitleDisplayMode = .always

        if let title = title {
            setLargeTitle(title: title)
        }

        if #available(iOS 16.0, *) {
            navigation.navigationBar.shadowImage = UIImage()
        }
    }
    
    func setLargeTitle(title: String) {
        navigation.navigationBar.topItem?.title = title
    }
}
