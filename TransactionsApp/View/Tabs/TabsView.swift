//
//  TabsView.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 02/01/24.
//

import Foundation
import SwiftUI

struct TabsView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
        TabView {

            BalancesView()
                .tabItem {
                    VStack {
                        Text(StringConstants.BalancesConstants.balancesTab)
                        Image(systemName: IconConstants.tray)
                    }
                }
            HistoryView()
                .tabItem {
                    VStack {
                        Text(StringConstants.HistoryConstants.historyTab)
                        Image(systemName: IconConstants.clockArrow)
                    }
                }
        } .accentColor(ColorConstants.navBarColor)
    }
}

#Preview {
    TabsView()
}

