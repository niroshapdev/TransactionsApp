//
//  SeperatorView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import SwiftUI

struct SeperatorView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(ColorConstants.navBarColor)
    }
}

#Preview {
    SeperatorView()
}
