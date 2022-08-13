//
//  SeifViewController.swift
//  ClothesStore
//
//  Created by Seif Awad on 8/13/22.
//

import UIKit
import CoreData

class SeifViewController: ViewController {
    
    let products = ["waffleDropImage1", "stripedShirtImage2",  "oversizeWhiteTImage3","brownHalfSleeveImage4"]
    
    
    
    
   
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollectionView.delegate = self
    
        
        productsCollectionView.dataSource = self
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
}
/*
class SeifViewController: ViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (products.count);
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCells", for: indexPath) as! ProductCells
        
        cell.productImageView.image = UIImage(named: products[indexPath.row])
      
        
        return cell
    }

*/
////////////////////////////////////////////////////////////////////////////////////////
    
    extension SeifViewController: UICollectionViewDelegate, UICollectionViewDataSource
    {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            
            return 1
            
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (products.count);
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCells", for: indexPath) as! ProductCells
        
        cell.productImageView.image = UIImage(named: products[indexPath.row])
        
        cell.productViewShape.layer.cornerRadius = 10
      
        
        return cell
    }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
     
*/
