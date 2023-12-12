//
//  Extensions.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 15/11/23.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        Double(self)
    }
    
    func toUUID() -> UUID {
        UUID(uuidString: self) ?? UUID()
    }
}

extension Double {
    func toString() -> String {
        "\(self)"
    }
}
