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
    
    var calculateTotalPrice: Double = 0.0{
        didSet{
            subTotalPriceLabel.text = "\(calculateTotalPrice)"
            totalPriceLabel.text = "\(calculateTotalPrice + 5.0)"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTotalPrice = 0
        cartProductList = queryCart()
        cartTableView.reloadData()
    }
    
    private func onRemoveProduct(indexPath:IndexPath){
        if indexPath.row > 0 {
            self.cartProductList.remove(at: indexPath.row)
            cartTableView.deleteRows(at: [indexPath], with: .automatic)
        }else{
            self.cartProductList.remove(at: 0)
            cartProductList = queryCart()
        }
        removeFromCart(productNumber: indexPath.row)
        cartTableView.reloadData()
        //self.cartTableView.beginUpdates()
       // cartTableView.endUpdates()
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
        calculateTotalPrice += Double(cartProductList[indexPath.row].price * cartProductList[indexPath.row].prodCount)
        cell.removeProduct = { (indexPath) in
            self.onRemoveProduct(indexPath: indexPath)
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
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        cartProductList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "Remove") {[weak self] _, _, _ in
            self?.cartProductList.remove(at: indexPath.row)
                       self?.cartTableView.beginUpdates()
            removeFromCart(productNumber: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        remove.image = UIImage(systemName: "minus.circle")
        return UISwipeActionsConfiguration(actions: [remove])
}
}

//struct Model {
//    var image : UIImage
//    var price : Double
//    var descreption : String
//    var counter : Int
//}

