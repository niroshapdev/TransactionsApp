//
//  NumberPadView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 12/09/23.
//

import Foundation
import SwiftUI

class AppConstants {
    static let deleteIcon: String = "delete.left"
    static let backButtonIcon: String = "arrow.left"
    static let themeColor: Color = ColorConstants.navBarColor
}

struct PinView: View {
    
    @State private var password: String = ""
    private let otpCount: Int = 4
    @State private var isPasswordEntered: Bool = false
    @State private var isPresentingNextScreen: Bool = false
    
    var numbers: [[String]] = [["1", "2", "3"],
                               ["4", "5", "6"],
                               ["7", "8", "9"],
                               [".", "0", AppConstants.deleteIcon]]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("Enter your passcode")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .padding(.bottom, 50)
                    .padding(.top, 100)
                HStack(spacing: 15) {
                    ForEach(0..<otpCount, id: \.self) { index in
                        PasswordView(index: index, password: $password)
                    }
                }
                Spacer()
                VStack(spacing: 0) {
                    ForEach(numbers, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(row, id: \.self) { column in
                                Spacer()
                                PasswordButton(
                                    value: column,
                                    password: $password,
                                    otpCount: otpCount
                                )
                                if row.last == column {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                Spacer()

                if password.count == otpCount {
                    NavigationLink {
                        BalancesView()
                    } label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(AppConstants.themeColor)
                            )
                            .padding(.horizontal,50)
                    }
                }
            }
        }
        .navigationBarTitle("Enter Passcode", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    struct PasswordView: View {
        var index: Int
        @Binding var password: String
        
        var body: some View {
            ZStack {
                let circleRadius: CGFloat = 20.0
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: circleRadius, height: circleRadius)
                
                if password.count > index {
                    Circle()
                        .fill(AppConstants.themeColor)
                        .frame(width: circleRadius, height: circleRadius)
                }
            }
        }
    }
    
    struct PasswordButton: View {
        var value: String
        @Binding var password: String
        let otpCount: Int
        
        var body: some View {
            Button(action: setPassword) {
                if value.count > 1 {
                    Image(systemName: AppConstants.deleteIcon)
                        .font(.system(size: 24))
                        .foregroundColor(Color.black)
                } else {
                    Text(value)
                        .font(.title)
                        .foregroundColor(Color.black)
                }
            }
            .frame(width: 30)
            .padding(15)
            
        }
        
        func setPassword() {
            if value == "." { return }
            if value.count > 1 {
                if password.count != 0 {
                    password.removeLast()
                }
            } else {
                if password.count != otpCount {
                    password.append(value)
                }
            }
        }
    }
}
