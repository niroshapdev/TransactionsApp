//
//  Transaction.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 03/01/24.
//

import Foundation

struct TransactionData: Codable, Identifiable {
    var id = UUID()  
    var fromAccount: String
    var toAccount: String
    var amount: String
}

class DataManager: ObservableObject {
    @Published var transactions: [TransactionData] = []
}
