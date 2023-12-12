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
    static let themeColor: Color = .blue
}

struct PinView: View {
    
    @State private var password: String = ""
    private let otpCount: Int = 4
    @State private var isPasswordEntered: Bool = false
    
    var numbers: [[String]] = [["1", "2", "3"],
                               ["4", "5", "6"],
                               ["7", "8", "9"],
                               [".", "0", AppConstants.deleteIcon]]
    
    var body: some View {
        VStack(spacing: 0) {

            Spacer()
            
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
            
//            Spacer()
            if password.count == otpCount {
//                isPasswordEntered.toggle()
                NavigationLink {
                    // destination view to navigation to
//                    TabsView()
                } label: {
                    Text("Go to next screen")
                        .foregroundColor(.green)
////                    Image(systemName: "list.dash")
////                        .foregroundColor(.gray)
                }
//                Button {
//                    NavigationLink(destination: OTPView()) {
//                                       Text("Do Something")
//                                   }
//                    print("Password is: ", password)
//                } label: {
//                    Text("Set password")
//                }
//                Spacer()
            }
        }
    }
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
    
