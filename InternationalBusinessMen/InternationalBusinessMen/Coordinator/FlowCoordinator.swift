//
//  FlowCoordinator.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import SwiftUI

protocol FlowCoordinator: AnyObject {
    func getMainListFlow() -> UINavigationController
    func goToDetailView()
}
