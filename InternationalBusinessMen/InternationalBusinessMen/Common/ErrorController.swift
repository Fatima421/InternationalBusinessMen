//
//  ErrorController.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 6/2/23.
//

import Foundation

protocol ErrorController: ObservableObject {
    var state: StateType { get set }
    
    @MainActor
    func changeState(to state: StateType)
}

protocol ErrorSectionController: ErrorController {
    func onTapRetryButton()
}
