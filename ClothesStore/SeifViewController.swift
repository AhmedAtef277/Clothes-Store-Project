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
    
   
    @IBOutlet weak var hiName: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        
        hiName.text = "Hi, \(theUser.name!)"
        if(!productsExists())
        {
            addProductsToCoreData()
        }
        getData()
        print(products.count)
        
        p = [products[0].image,products[1].image, products[2].image, products[3].image]
        t = [products[0].name,products[1].name, products[2].name, products[3].name]
        prPrices = [products[0].price,products[1].price, products[2].price, products[3].price]
        
        
     //   addToCart(x: products[0])
     //   addToCart(x: products[0])
        
     //   removeFromCart(x: products[0])
        
        
        self.tabBarController?.navigationItem.hidesBackButton = true

        productsCollectionView.delegate = self
    
        
        productsCollectionView.dataSource = self
        
        
      
       // self.tabBarController?.navigationItem.hidesBackButton = true
        
        
        
        
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
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedItem = products[indexPath.row]
                        
            let detailsVC = UIStoryboard(name: "AhmedStoryboard", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
            detailsVC.productDetails = selectedItem
            detailsVC.productNumber = indexPath.row
            self.present(detailsVC, animated: true, completion: nil)
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
