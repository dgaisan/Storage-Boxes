//
//  Location.swift
//  Storage-Boxes
//

import UIKit

struct Location: Codable {
    var id: UUID
    var name: String
    //var color: String // String representation of HEX
    //var createdAt: Date
        
    func save () {
        LocalDataManager.save(self, with: id.uuidString)
    }
    
    func delete () {
        LocalDataManager.delete(id.uuidString)
    }
    
}
