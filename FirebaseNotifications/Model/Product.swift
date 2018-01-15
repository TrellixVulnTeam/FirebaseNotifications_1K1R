//
//  Product.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import Foundation

struct Product
{
    let title: String
    let cost: Double
    
    func price() -> String
    {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
}
