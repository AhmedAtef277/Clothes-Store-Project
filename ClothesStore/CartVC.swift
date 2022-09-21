//
//  CartVC.swift
//  ClothesStore
//
//  Created by mac on 12/08/2022.
//

import UIKit

class CartVC: UIViewController {
    var cartProductList = [Product]()
// MARK: Outlets
    @IBOutlet weak var cartTableView: UITableView!
// MARK: life cycle
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var subTotalPriceLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    
 
    
    var calculateTotalPrice: Double = 0.0{
        didSet{
            subTotalPriceLabel.text = "\(calculateTotalPrice)"
            totalPriceLabel.text = "\(calculateTotalPrice + 5.0)"
            if calculateTotalPrice == 0 {
                totalPriceLabel.text = "0.0"
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        shippingLabel.text = "5.0"
        cartTableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTotalPrice = 0
        cartProductList = queryCart()
        cartTableView.reloadData()
        cartProductList.forEach { product in
            calculateTotalPrice += Double(product.price * product.prodCount)
        }

    }

    @IBAction func checkoutButton(_ sender: Any) {
       // showAlert(message: "Done Successfully", title: "Checkout")
        zeroCart()
        calculateTotalPrice = 0
        cartProductList = queryCart()
        cartTableView.reloadData()
    }
//    private func showAlert(message:String, title : String)
//    {
//        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
    
}
extension CartVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as!
        CartTableViewCell
        cell.selectionStyle = .none
        let cartData = cartProductList[indexPath.row]
        cell.setUpCell(productDetailsModel: cartData)
        cell.productIndex = indexPath
        cell.productItem = cartProductList[indexPath.row]
        cell.removeProduct = { (indexPath) in
            self.cartProductList = queryCart()
            if self.cartProductList.count == 0 {
                self.calculateTotalPrice = 0
            }
            self.cartTableView.reloadData()
        }
        cell.increaseTotalPrice = { (totlaPrice) in
            self.calculateTotalPrice += totlaPrice
        }
        cell.decreaseTotalPrice = { (totlaPrice) in
            self.calculateTotalPrice -= totlaPrice
        }
        return cell
    }
    
}

