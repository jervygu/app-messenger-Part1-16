//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Jervy Umandap on 6/2/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    public func test() {
        database.child("foo").setValue(["something": true])
    }
}
