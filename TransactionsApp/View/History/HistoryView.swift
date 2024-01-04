//
//  HistoryView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 02/01/24.
//

import SwiftUI

struct HistoryView: View {
    typealias Transactions = [TransactionData]
    @ObservedObject var dataManager = DataManager()
    @State private var transactions: [TransactionData] = []
    
    var body: some View {
        ScrollView {
            AnyView(transactionListView)
        }
        .customNavigationView(title: StringConstants.HistoryConstants.historyTab)
        .onAppear {
            loadTransactions()
        }
    }
    
    private var transactionListView: some View {
        if transactions.isEmpty {
            return AnyView(Text("No transactions found"))
        } else {
            return AnyView(transactionSectionView(
                title: StringConstants.transactions,
                transactions: transactions
            ))
        }
    }
    
    private func loadTransactions() {
        if let transactionsData = UserDefaults.standard.data(forKey: "Transactions") {
            do {
                let decoder = JSONDecoder()
                transactions = try decoder.decode([TransactionData].self, from: transactionsData)
            } catch {
                print("Error decoding transactions: \(error)")
            }
        }
    }
    
    private func transactionSectionView(title: String, transactions: Transactions) -> some View {
        Section(header: SectionHeaderView(title: title)) {
            ForEach(transactions) { transaction in
                transactionRowView(for: transaction)
            }
        }
    }
    
    private func transactionRowView(for transaction: TransactionData) -> some View {
        VStack {
            HStack(alignment: .top) {
                getTransactionIcon(for: transaction)
                Spacer()
                transactionDetailView(for: transaction)
                Spacer()
                transactionAmountView(for: transaction)
            }
            SeperatorView()
        }
        .padding(.horizontal)
    }
    
    private func getTransactionIcon(for transaction: TransactionData) -> some View {
        Image(systemName: IconConstants.menucard)
            .resizable()
            .frame(width: 25, height: 25)
            .padding()
    }
    
    private func transactionDetailView(for transaction: TransactionData) -> some View {
        VStack(alignment: .leading) {
            Text(transaction.fromAccount)
                .font(.body)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(transaction.toAccount )
                .font(.body)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
    }
    
    private func transactionAmountView(for transaction: TransactionData) -> some View {
        VStack(alignment: .trailing) {
            Text(transaction.amount )
        }.padding(.top, 10)
    }
}

struct SectionHeaderView: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.headline)
                .padding(.horizontal, 10)
            Spacer()
            SeperatorView()
                .padding(.horizontal, 10)
        }
    }
}


