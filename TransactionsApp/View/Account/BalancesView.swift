//
//  BalancesView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import SwiftUI

struct BalancesView: View {
    
    @ObservedObject var viewModel = AccountsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        contentView
            .navigationBarHidden(true)
    }
    
    private var contentView: some View {
        AnyView(viewAccountsList)
    }

    private var viewAccountsList: some View {
        ViewAccounts()
    }
}

#Preview {
    BalancesView()
}
