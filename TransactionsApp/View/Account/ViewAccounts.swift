//
//  ViewAccounts.swift
//  ExpenseTracker
//
//  Created by Nirosha Pabolu on 22/10/23.
//

import SwiftUI

struct ViewAccounts: View {
    
    @ObservedObject var viewModel = AccountsViewModel()
    @Environment(\.dismiss) private var dismiss
      
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                headerView
                SeperatorView()
                ScrollView {
                    paymentAccountsView
                    contentView
                }
            }
        }
    }
    
    private var contentView: some View {
        AnyView(accountsListView)
    }
    
    private var paymentAccountsView: some View {
        VStack(alignment: .leading) {
            Text(StringConstants.AccountConstants.paymentAccounts)
                .foregroundColor(.black)
                .font(.headline)
                .fontWeight(.bold)
            SeperatorView()
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        
    }
    private var headerView: some View {
        HStack {
            navigationTitle
            Spacer()
            NavigationLink(destination: TransferView()) {
                Icons.transferImage
            }
        }
    }
    private var navigationTitle: some View {
        DateHeaderView(day: "\(Utils.getDay())",
                       dayName: "\(Utils.getDayName())",
                       month: "\(Utils.getMonth())",
                       year: "\(Utils.getYear())")
    }
 
    private var accountsListView: some View {
        ForEach(StringConstants.TestAccounts.indices, id: \.self) { index in
            let account = StringConstants.TestAccounts[index]
            getAccountView(account: account)
        }
    }
    
    private func getAccountView(account: Account) -> some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: IconConstants.menucard)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(ColorConstants.navBarColor)
                    .padding(.top)
                    .padding(.horizontal)
                Spacer()
                    viewTransactions(for: account)
            }
            SeperatorView()
                .padding(.horizontal, 15)
        }
    }
    
    private func viewTransactions(for account: Account) -> some View {
        VStack(alignment: .leading) {
            Text(account.title ?? "")
                .font(.body)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(account.balance?.toString() ?? "0.0")
                    .font(.body)
                    .fontWeight(.regular)
        }
    }
}
