// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// MARK: - Strings

// swiftlint:disable all
// swiftlint:disable file_length

public enum L10n {
  /// Amount:
  public static let amount = LocalizedString(lookupKey: "amount")
  /// Conversion:
  public static let conversion = LocalizedString(lookupKey: "conversion")
  /// Transaction Detail
  public static let detailViewTitle = LocalizedString(lookupKey: "detail_view_title")
  /// Error
  public static let error = LocalizedString(lookupKey: "error")
  /// There has been an error retrieving data
  public static let errorMessage = LocalizedString(lookupKey: "error_message")
  /// Grouped Elements
  public static let groupedElements = LocalizedString(lookupKey: "grouped_elements")
  /// Trade List
  public static let listViewTitle = LocalizedString(lookupKey: "list_view_title")
  /// Product:
  public static let product = LocalizedString(lookupKey: "product")
  /// Rate:
  public static let rate = LocalizedString(lookupKey: "rate")
  /// Retry
  public static let retry = LocalizedString(lookupKey: "retry")
  /// SKU
  public static let sku = LocalizedString(lookupKey: "sku")
  /// Total
  public static let total = LocalizedString(lookupKey: "total")
  /// Total Elements
  public static let totalElements = LocalizedString(lookupKey: "total_elements")
}

// MARK: - Implementation Details

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = GeneratedUtils.format(key, table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

public struct LocalizedString {
  internal let lookupKey: String

  var key: LocalizedStringKey {
    LocalizedStringKey(lookupKey)
  }

  var text: String {
    L10n.tr("Localizable", lookupKey)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}
