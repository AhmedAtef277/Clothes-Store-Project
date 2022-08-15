//
//  SeifViewController.swift
//  ClothesStore
//
//  Created by Seif Awad on 8/13/22.
//

import UIKit
import CoreData

var p = [String?]() //string for product images
var t = [String?]() //string for product name
var prPrices = [Int64]() //intfor product prices

class SeifViewController: ViewController {
    
   
    @IBOutlet weak var productsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!productsExists())
        {
            addProductsToCoreData()
        }
        getData()
        print(products.count)
        
        p = [products[0].image,products[1].image, products[2].image, products[3].image]
        t = [products[0].name,products[1].name, products[2].name, products[3].name]
        prPrices = [products[0].price,products[1].price, products[2].price, products[3].price]
        
        
        addToCart(productNumber: Int(products[0].productNumber))
        addToCart(productNumber: Int(products[0].productNumber))
        
        removeFromCart(productNumber: Int(products[0].productNumber))
        
        


        productsCollectionView.delegate = self
    
        
        productsCollectionView.dataSource = self
        
        
      
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
}

    
    extension SeifViewController: UICollectionViewDelegate, UICollectionViewDataSource
    {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            
            return 1
            
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (p.count);
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCells", for: indexPath) as! ProductCells
        
        cell.productImageView.image = UIImage(named: p[indexPath.row]!)
        cell.productNameLbl.text = t[indexPath.row]!
        cell.productPriceLbl.text = "$ " + String(prPrices[indexPath.row])
        
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
