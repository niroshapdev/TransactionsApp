//
//  StringConstants.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import Foundation

public enum DefaultConstants {
    public static let defaultAccount = Account(balance: 0.0, title: "",
                                               currency: .inr, notes: "")
}

struct StringConstants {
    static let enterCode = "Enter your Easy Banking code"
    static let accounts = "Accounts"
    static let inrCurrency = "INR"
    static let transactions = "Transactions"
    
    static let TestAccounts = [
        Account(balance: 10000.0, title: "Savings1", currency: .inr, notes: "Savings account"),
        Account(balance: 20000.0, title: "Savings2", currency: .inr, notes: "Savings account"),
        Account(balance: 30000.0, title: "Savings3", currency: .inr, notes: "Savings account"),
        Account(balance: 40000.0, title: "Savings4", currency: .inr, notes: "Savings account"),
        Account(balance: 50000.0, title: "Savings5", currency: .inr, notes: "Savings account"),
        Account(balance: 60000.0, title: "Savings6", currency: .inr, notes: "Savings account")
    ]
    
    public enum BalancesConstants {
        public static let balancesTab = "Balances"
        public static let transferTab = "Transfer"
    }
    
    public enum HistoryConstants {
        public static let historyTab = "History"
    }
    
    public enum TransferConstants {
        public static let fromAccount = "From Account"
        public static let toAccount = "To Account"
        public static let beneficiaryName = "Beneficiary Name"
        public static let amount = "Amount"
        
    }
    
    public enum AccountConstants {
        public static let paymentAccounts = "Payment Accounts"
    }
}
