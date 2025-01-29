//
//  LandingViewModel.swift
//  Gradebook
//
//  Created by Russell Gordon on 2025-01-29.
//

import Foundation
import OSLog

@Observable
class LandingViewModel {
    
    // MARK: Stored properties
    
    // Connection to the database
    private let db: DatabaseConnection
    
    // List of students
    var studentCount: Int?
    
    // MARK: Initializer(s)
    init(using db: DatabaseConnection) {
        Logger.database.info("About to intialize LandingViewModel.")
        self.db = db
        
        // Get the count of students
        //
        // NOTE:
        //
        // The call goes over the network.
        // It will take an undetermined amount of time to talk to the database,
        // so the function is marked with "async" and we must
        // use a Task closure to run this function and await the results.
        //
        // The Task closure is used to run an "async" task within a synchronous
        // function (the initializer is syncrhonous; without the Task closure
        // we could not otherwise call upon an asynchronous function).
        Task {
            self.studentCount = await self.getCountOfStudents()
        }
        Logger.database.info("LandingViewModel initialized.")
    }
    
    // MARK: function(s)
    private func getCountOfStudents() async -> Int? {
        
        Logger.database.info("At start of getCountOfStudents function...")
        
        do {
            
            let count = try await db.supabase
                .from("student")
                .select("*", head: true, count: .exact)
                .execute()
                .count
            
            Logger.database.info("There are \(count ?? 0) students.")
            return count
            
        } catch {
            
            Logger.database.error("Could not retrieve count of students from database.")
            return nil
            
        }

    }
}
