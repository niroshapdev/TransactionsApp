//
//  TransferView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 16/11/23.
//

import SwiftUI

struct AccountsListView: View {
    @Binding var selectedAccount: Account
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(StringConstants.TestAccounts, id: \.self) { account in
                VStack(alignment: .leading) {
                    Text(account.title ?? "")
                    Text("\(account.balance ?? 0.0)")
                }
                .onTapGesture {
                    selectedAccount = account
                    dismiss()
                }
            }
        }
    }
}

struct TransferView: View {
    @State var fromAccount: String = ""
    @State var toAccount: String = ""
    @State var beneficiaryName: String = ""
    @State var amount: String = ""
    @State private var isFromAccountTapped = false
    @State private var isToAccountTapped = false
    @State private var isPayment = false
    @State var selectedFromAccount: Account = DefaultConstants.defaultAccount
    @State var selectedToAccount: Account = DefaultConstants.defaultAccount

    var body: some View {
        ScrollView{
            //            contentView
            fromAccountDisplayView
            toAccountDisplayView
            beneficiaryView
                .padding(.top, 20)
            amountDisplayView
                .padding(.top, 20)
            proceedButtonView
        }
        .customNavigationView(title: "Transfer")
        .sheet(isPresented: $isFromAccountTapped) {
            AccountsListView(selectedAccount: $selectedFromAccount)
        }
        .sheet(isPresented: $isToAccountTapped) {
            AccountsListView(selectedAccount: $selectedToAccount)
        }
        
    }
    
    private var fromAccountDisplayView: some View {
        guard let title = $selectedFromAccount.wrappedValue.title else {
            return AnyView(EmptyView())
        }
        return AnyView(
            ButtonsView(
                title: title.isEmpty
                ? StringConstants.TransferConstants.fromAccount
                : title,
                buttonStyle: .custom,
                action: {
                    isFromAccountTapped.toggle()
                }
            )
        )
    }
    
    private var toAccountDisplayView: some View {
        guard let title = $selectedToAccount.wrappedValue.title else {
            return AnyView(EmptyView())
        }
        return AnyView(
            ButtonsView(
                title: title.isEmpty
                ? StringConstants.TransferConstants.toAccount
                : title,
                buttonStyle: .custom,
                action: {
                    isToAccountTapped.toggle()
                }
            )
        )
    }
    
    private var beneficiaryView: some View {
        UnderlineTextFieldView(
            text: $beneficiaryName,
            textFieldView: beneficiaryNameView,
            placeholder: StringConstants.TransferConstants.beneficiaryName)
    }
    
    private var amountDisplayView: some View {
        UnderlineTextFieldView(
            text: $amount,
            textFieldView: amountView,
            placeholder: StringConstants.TransferConstants.amount)
    }
    
    private var proceedButtonView: some View {
        ButtonsView(title: "Proceed to pay", buttonStyle: .primary, action: {
            isPayment.toggle()
        })
        .sheet(isPresented: $isPayment, content: {
            SuccessView()
        })
        .padding(.top, 30)
    }

}
extension TransferView {
    private var fromAccountView: some View {
        TextField("", text: $fromAccount)
            .foregroundColor(.black)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
    private var toAccountView: some View {
        TextField("", text: $toAccount)
            .foregroundColor(.black)
            .keyboardType(.numberPad)
            .autocapitalization(.none)
    }
    
    private var beneficiaryNameView: some View {
        TextField("", text: $beneficiaryName)
            .foregroundColor(.black)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
    private var amountView: some View {
        TextField("", text: $amount)
            .foregroundColor(.black)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
    
}

#Preview {
    TransferView()
}
