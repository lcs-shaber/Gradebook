//
//  Student.swift
//  GradebookMobile
//
//  Created by Sophie Haber on 29.01.25.
//

import Foundation


struct Student: Identifiable, Codable {
    
    
    // MARK: Stored properties
    let id: Int
    let firstName: String
    let lastName: String
    
    
    // MARK: Enumeration
    //Provide encoding/decoding hints
    //to supabase
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
