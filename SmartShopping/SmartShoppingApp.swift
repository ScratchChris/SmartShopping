//
//  SmartShoppingApp.swift
//  SmartShopping
//
//  Created by Chris Turner on 14/06/2021.
//

import SwiftUI

@main
struct SmartShoppingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
