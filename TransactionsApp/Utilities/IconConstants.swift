//
//  IconConstants.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 09/10/23.
//

import Foundation
import SwiftUI

class IconConstants {
    static let menucard = "menucard"
    static let tray = "tray"
    static let gear = "gear"
    static let plus = "plus.circle"
    static let transfer = "arrow.left.arrow.right"
    static let transferCircle = "arrow.left.arrow.right.circle"
    static let chevronRight = "chevron.right"
    static let chevronDown = "chevron.down"
    static let clockArrow = "clock.arrow.circlepath"
}
struct Icons {
    static var plusImage: some View {
        Image(systemName: IconConstants.plus)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .foregroundColor(ColorConstants.navBarColor)
            .padding()
    }
    static var transferImage: some View {
        Image(systemName: IconConstants.transferCircle)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .foregroundColor(ColorConstants.navBarColor)
            .padding()
    }
}
