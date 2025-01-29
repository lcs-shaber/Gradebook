//
//  LandingView.swift
//  GradebookMobile
//
//  Created by Russell Gordon on 2025-01-27.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    // Access the view model
    let viewModel: LandingViewModel
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                if let count = viewModel.studentCount {
                    Text("There are \(count) students in the database.")
                } else {
                    Text("Could not find count of students in database.")
                }
                
                List(viewModel.students) { currentStudent in
                
                    Text("\(currentStudent.lastName), \(currentStudent.firstName)")
                }
            }
            .navigationTitle("Gradebook")
        }
        .padding()
    }
    
}

#Preview {
    
    @Previewable @State var viewModel = LandingViewModel(using: DatabaseConnection())
    
    LandingView(viewModel: viewModel)
    
}
