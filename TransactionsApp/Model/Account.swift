//
//  Account.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import Foundation

public enum Currency: String {
    case inr = "INR"
    case usd = "USD"
}

public struct Account: Hashable {
    let balance: Double?
    let title: String?
    let currency: Currency?
    let notes: String?
}
