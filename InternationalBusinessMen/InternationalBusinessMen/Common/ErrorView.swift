//
//  ErrorView.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 6/2/23.
//

import SwiftUI

struct ErrorView: View {
    var error: RestError
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    section
                        .padding()
                        .frame(maxWidth: geometry.size.width,
                               minHeight: geometry.size.height)
                }
                .multilineTextAlignment(.center)
            }
        }
    }

    private var section: some View {
        VStack(spacing: 20) {
            Text(Localized.error.text)
                .font(.title)
                .fontWeight(.bold)
            Text(Localized.errorMessage.text)
                .foregroundColor(Asset.gray.color)
                .fontWeight(.bold)
            Button {
                onTap()
            } label: {
                HStack {
                    Spacer()
                    Text(Localized.retry.text)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .background(Asset.orange.color)
                .cornerRadius(10)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .emptyData, onTap: {})
    }
}
