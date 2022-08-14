//
//  CartVC.swift
//  ClothesStore
//
//  Created by mac on 12/08/2022.
//

import UIKit

class CartVC: UIViewController {
    var arr = [Model]()
// MARK: Outlets
    @IBOutlet weak var cartTableView: UITableView!
// MARK: life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.dataSource = self
        cartTableView.delegate = self
        arr.append(Model(image: UIImage(named: "clothesImage1")!, price: 120, descreption: "Outfit", counter: 2))
        arr.append(Model(image: UIImage(named: "clothesImage2")!, price: 120, descreption: "Outfit", counter: 2))
        arr.append(Model(image: UIImage(named: "clothesImage3")!, price: 120, descreption: "Outfit", counter: 2))
        arr.append(Model(image: UIImage(named: "clothesImage3")!, price: 120, descreption: "Outfit", counter: 2))

        // Do any additional setup after loading the view.
    }
    

}
extension CartVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as!
        CartTableViewCell
        let cartData = arr[indexPath.row]
        cell.setUpCell(model: cartData)
        return cell
    }
    
}
extension CartVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arr.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "Remove") {[weak self] _, _, _ in
            self?.arr.remove(at: indexPath.row)
            self?.cartTableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
        }
        remove.image = UIImage(systemName: "minus.circle")
        return UISwipeActionsConfiguration(actions: [remove])
}
}

struct Model {
    var image : UIImage
    var price : Double
    var descreption : String
    var counter : Int
}

