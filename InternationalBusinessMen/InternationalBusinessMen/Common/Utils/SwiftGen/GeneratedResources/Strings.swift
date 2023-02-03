// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// MARK: - Strings

// swiftlint:disable all
// swiftlint:disable file_length

public enum L10n {
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
