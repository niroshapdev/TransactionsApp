//
//  ContentView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 09/09/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(StringConstants.enterCode)
                    .padding(.top,20)
                PinView()
                    .padding(.top,30)
                    .padding(.bottom,50)
                Button {
                    print("Image tapped!")
                } label: {
                    Text("Code Forgotten?")
                        .tint(.green)
                        .fontWeight(.bold)
                }
            }
            .customNavigationView(title: "Login")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("< Back") {
                        print("Back tapped!")
                    }
                    .tint(.white)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
