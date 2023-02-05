//
//  ViewModelCoordinatorProtocol.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import SwiftUI

protocol ViewModelCoordinatorProtocol: AnyObject {
    var coordinator: FlowCoordinator { get set }
    init()
    init(coordinator: FlowCoordinator)
}

class ViewModelCoordinator: ViewModelCoordinatorProtocol {
    var coordinator: FlowCoordinator

    required init() {
        self.coordinator = MainCoordinator.fakeCoordinator
    }

    convenience required init(coordinator: FlowCoordinator = MainCoordinator.fakeCoordinator) {
        self.init()
        self.coordinator = coordinator
    }
}
