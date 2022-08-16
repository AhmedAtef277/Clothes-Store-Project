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
        cartTableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTotalPrice = 0
        cartProductList = queryCart()
        cartTableView.reloadData()
    }


}
extension CartVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as!
        CartTableViewCell
        let cartData = cartProductList[indexPath.row]
        cell.setUpCell(productDetailsModel: cartData)
        cell.productIndex = indexPath
        cell.productItem = cartProductList[indexPath.row]
        calculateTotalPrice += Double(cartProductList[indexPath.row].price * cartProductList[indexPath.row].prodCount)
        cell.removeProduct = { (indexPath) in
            self.calculateTotalPrice = 0
            self.cartProductList = queryCart()
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
extension CartVC : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        cartProductList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
//    }
//
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        print("self?.cartProductList[indexPath.row] is \(self.cartProductList.count)")
//        let remove = UIContextualAction(style: .destructive, title: "Remove") {[weak self] _, _, _ in
//            removeFromCart(x: self?.cartProductList[indexPath.row] ?? Product())
//            self?.cartTableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//        }
//        remove.image = UIImage(systemName: "minus.circle")
//        return UISwipeActionsConfiguration(actions: [remove])
//}
}

//struct Model {
//    var image : UIImage
//    var price : Double
//    var descreption : String
//    var counter : Int
//}

