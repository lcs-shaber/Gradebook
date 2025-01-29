//
//  GradebookMobileApp.swift
//  GradebookMobile
//
//  Created by Russell Gordon on 2025-01-27.
//

import SwiftUI

@main
struct GradebookMobileApp: App {
    
    // MARK: Stored properties
    @State private var db: DatabaseConnection
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            LandingView(
                viewModel: LandingViewModel(using: db)
            )
            // Add the database connection to the environment
            // so it is accessible to child views
            .environment(db)
        }
    }
    
    // MARK: Initializer(s)
    init() {
        
        // Set up database connection
        self.db = DatabaseConnection()
    }
}
