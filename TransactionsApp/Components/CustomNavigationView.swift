//
//  CustomNavigationView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import Foundation
import SwiftUI

struct CustomNavigationView<Content: View>: View {
    var title: String
    var content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            content
                .padding()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .tint(.white)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(ColorConstants.navBarColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

extension View {
    func customNavigationView(title: String) -> some View {
        CustomNavigationView(title: title) { self }
    }
}
