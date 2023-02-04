//
//  IBMURL.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

enum IBMURLString {
    case conversionRate
    case transaction
    
    var url: String {
        switch self {
        case .conversionRate:
            return "\(baseURLString)/rates"
        case .transaction:
            return "\(baseURLString)/transactions"
        }
    }
    
    var baseURLString: String {
        return "https://android-ios-service.herokuapp.com"
    }
}
