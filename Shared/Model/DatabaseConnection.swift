//
//  DatabaseConnection.swift
//  Gradebook
//
//  Created by Russell Gordon on 2025-01-27.
//

import OSLog
import Foundation
import Security
import Supabase

@Observable
class DatabaseConnection {
    
    let supabase: SupabaseClient
    
    init() {
        
        Logger.database.info("About to create supabase client object.")
        
        self.supabase = SupabaseClient(
          supabaseURL: URL(string: "https://jwooyzunkltzkuhptxmj.supabase.co")!,
          supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp3b295enVua2x0emt1aHB0eG1qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc5OTIxMzMsImV4cCI6MjA1MzU2ODEzM30.KPyoxq1k-sq0hvQnxhavHhmPozO-tcoJBM_UcAMaqpk"
        )
                
    }
    
    
}
