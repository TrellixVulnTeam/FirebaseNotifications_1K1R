//
//  ProductsSnapshot.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import Firebase

struct ProductsSnapshot //Converting DataSnapshot into a ProductSnapshot and the ProductSnapshot will have a property which is an array of products
{
    let products: [Product]
    
    init?(snapshot: DataSnapshot)
    {
        guard let snapDict = snapshot.value as? [String: [String: Any]] else { return nil }
        var products = [Product]()
        for snap in snapDict
        {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
        }
        self.products = products
    }
}

