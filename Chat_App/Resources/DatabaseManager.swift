//
//  DatabaseManager.swift
//  Chat_App
//
//  Created by BuiNgocSon on 5/25/21.
//  Copyright © 2021 BuiNgocSon. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

//MARK: Account Management

extension DatabaseManager {
    
    public func userExists(with email:String,
                           completion: @escaping ((Bool) -> Void)) {
        
        database.child(email).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(true)
                return
            }
            
            completion(true)
        })
        
    }
    ///insert new user to database
    public func insertUser(with user: ChapAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct ChapAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String
}