//
//  GeneratedUtils.swift
//  InternationalBussinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

typealias Localized = L10n

class GeneratedUtils {
    static func format(_ key: String, _ table: String) -> String {
        return NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    }
}

private final class BundleToken {}
