//
//  FirebaseDatabaseService.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import Firebase

enum FirebaseDatabaseReference: String {
    case products = "products"
}

class FirebaseDatabaseService {
    
    private init() {}
    static let shared = FirebaseDatabaseService()
    
    func reference(_ databaseReference: FirebaseDatabaseReference) -> DatabaseReference
    {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    //Observe changes in the app
    func observe(_ databaseReference: FirebaseDatabaseReference, completion: @escaping (DataSnapshot) -> Void)
    {
        reference(databaseReference).observe(.value)
        { (snapshot) in
            completion(snapshot)
        }
    }
    
    //Post changes to the app
    func post(parameters: [String: Any], to databaseReference: FirebaseDatabaseReference)
    {
        reference(databaseReference).childByAutoId().setValue(parameters) //Set the child values for products child.
    }
    
}
