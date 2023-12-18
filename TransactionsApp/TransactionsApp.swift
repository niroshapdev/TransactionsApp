//
//  TransactionsAppApp.swift
//  TransactionsApp
//
//  Created by Nirosha Pabolu on 09/09/23.
//

import SwiftUI
import IntentsUI
import Intents

@main
struct TransactionsApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            PinView()
        }.onChange(of: scenePhase) { phase in
            INPreferences.requestSiriAuthorization({status in
                // Handle errors here
            })
        }
    }
}
