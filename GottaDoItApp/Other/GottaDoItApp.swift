//
//  GottaDoItApp.swift
//  GottaDoItApp
//
//  Created by Stanislav on 26.06.2023.
//

import FirebaseCore
import SwiftUI

@main
struct GottaDoItAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
