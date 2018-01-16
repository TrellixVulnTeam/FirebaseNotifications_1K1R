//
//  AlertService.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import UIKit

class AlertService
{
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void)
    {
        let alert = UIAlertController(title: "New Product", message: "What's for sale?", preferredStyle: .alert)
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Title"
        }
        alert.addTextField { (priceTextField) in
            priceTextField.placeholder = "Price"
            priceTextField.keyboardType = .numberPad
        }
        let send = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, let price = alert.textFields?.last?.text,
                let cost = Double(price) else {return}
            
            let product = Product(title: title, cost: cost)
            completion(product)
        }
        alert.addAction(send)
        vc.present(alert, animated: true)
    }
    
    static func subscribeAlert(in vc: UIViewController)
    {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let subscribe = UIAlertAction(title: "Subscribe", style: .default)
        { (_) in
            FirebaseMessagingService.shared.subscribe(to: .newProducts)
        }
        
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default)
        { (_) in
            FirebaseMessagingService.shared.unsubscribe(from: .newProducts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true)
    }
}
