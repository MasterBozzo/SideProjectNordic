//
//  SideProjectNordicAppApp.swift
//  SideProjectNordicApp
//
//  Created by Pawel Kacela on 23/04/2022.
//

import SwiftUI

@main
struct SideProjectNordicAppApp: App {
//    let persistenceController = PersistenceController.shared

//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
