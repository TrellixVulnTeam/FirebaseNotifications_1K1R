//
//  ProductsService.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate //Always watch for when it changes which will then update the UI
{
    func didChange(products: [Product])
}

class ProductsService {
    
    private init() {}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observeProducts() {
        FirebaseDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductsSnapshot(snapshot: snapshot) else { return }
            self.delegate?.didChange(products: productsSnapshot.products)
        }
    }
    
    func post(product: Product) //When we post a product
    {
        FirebaseDatabaseService.shared.post(parameters: product.parameters(), to: .products)
    }
    
}
