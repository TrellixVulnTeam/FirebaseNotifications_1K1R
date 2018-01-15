//
//  ProductCell.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with product: Product)
    {
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
    
}
