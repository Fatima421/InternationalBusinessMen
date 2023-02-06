// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let orange = ColorAsset(name: "Orange")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
    let name: String

    internal var color: Color {
        Color(self)
    }
}

internal extension Color {
    /// Creates a named color.
    /// - Parameter asset: the color resource to lookup.
    init(_ asset: ColorAsset) {
        let bundle = Bundle(for: BundleToken.self)
        self.init(asset.name, bundle: bundle)
    }
}

internal struct ImageAsset {
    let name: String

    internal var image: Image {
        Image(name)
    }
}

internal extension Image {
    /// Creates a labeled image that you can use as content for controls.
    /// - Parameter asset: the image resource to lookup.
    init(_ asset: ImageAsset) {
        let bundle = Bundle(for: BundleToken.self)
        self.init(asset.name, bundle: bundle)
    }
}

private final class BundleToken {}
