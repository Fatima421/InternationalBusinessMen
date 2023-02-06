//
//  ErrorSectionView.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 6/2/23.
//

import SwiftUI

struct ErrorSectionView<Content, ErrorManager>: View where Content: View, ErrorManager: ErrorSectionController {
    var view: Content
    @ObservedObject var errorManager: ErrorManager

    init(@ViewBuilder content: () -> Content, errorManager: ErrorManager) {
        self.view = content()
        self.errorManager = errorManager
    }

    var body: some View {
        switch errorManager.state {
        case .error(let errorType):
            ErrorView(error: errorType,
                      onTap: { errorManager.onTapRetryButton() })
        case .loading, .loaded, .emptyData:
            view
                .redacted(reason: errorManager.state == .loading ? .placeholder : .init())
        }
    }
}
