//
//  ViewController.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ProductsService.shared.delegate = self
        ProductsService.shared.observeProducts()
    }
    
    @IBAction func onAddTapped(_ sender: Any)
    {
        AlertService.addProductAlert(in: self) { (product) in
            ProductsService.shared.post(product: product)
        }
    }
    
    @IBAction func onSubscribeTapped(_ sender: Any)
    {
        AlertService.subscribeAlert(in: self)
    }
}

extension ViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
}

extension ViewController: ProductsServiceDelegate
{
    func didChange(products: [Product]) //Whenever products change.
    {
        self.products = products
        collectionView.reloadData()
    }
}


