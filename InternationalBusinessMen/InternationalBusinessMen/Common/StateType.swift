//
//  StateType.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 6/2/23.
//

import Foundation

enum StateType: Equatable {
    case emptyData
    case loading
    case loaded
    case error(RestError)
}
