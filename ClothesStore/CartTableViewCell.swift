//
//  CartTableViewCell.swift
//  ClothesStore
//
//  Created by mac on 12/08/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    // MARK: outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descreptionLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var sizeButton: UILabel!
    // MARK: Variables
    var counterHelper:Int = 0
    var productPrice = 0
    var removeProduct:((IndexPath)->Void)? = nil
    var increaseTotalPrice:((Double)->Void)? = nil
    var decreaseTotalPrice:((Double)->Void)? = nil
    var productIndex: IndexPath?
    var productTotalPrice: Double = 0.0
    var productItem = Product()

    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUi()

    }
    
    // MARK: Functions
    
   private func updateUi(){
        [minusButton,plusButton].forEach { button in
            button?.layer.cornerRadius = (button?.frame.width)! / 2
            button?.layer.borderColor = UIColor.darkGray.cgColor
            button?.layer.borderWidth = 0.8
        }
        productImage.layer.cornerRadius = 20
        
        sizeButton.layer.borderColor = UIColor.darkGray.cgColor
        sizeButton.layer.borderWidth = 0.8
       //self.navigationItem.setHidesBackButton(true, animated: true);

    }
    func setUpCell(productDetailsModel : Product){
        productPrice = Int(productDetailsModel.price)
        counterHelper = Int(productDetailsModel.prodCount)
        productTotalPrice = Double(productDetailsModel.price * 1)
        sizeButton.text = productDetailsModel.size
        productImage.image = UIImage(named: productDetailsModel.image ?? "") 
        priceLabel.text = "\(productDetailsModel.price)"
        descreptionLabel.text = productDetailsModel.prodDescription
        counterLabel.text = "\(productDetailsModel.prodCount)"
    }

    // MARK: IBAtions
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        counterHelper += 1
        counterLabel.text = "\(counterHelper)"
        productTotalPrice = Double(1 * productPrice)
        increaseTotalPrice?(productTotalPrice)
        guard let index = productIndex?.row else{
            return
        }
        addToCart(x: productItem)

    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        
        if counterHelper > 1 {
            counterHelper -= 1
            counterLabel.text = "\(counterHelper)"
            productTotalPrice = Double(1 * productPrice)
            decreaseTotalPrice?(productTotalPrice)
            removeFromCart(x: productItem)
        }else if counterHelper == 1{
            counterHelper -= 1
            counterLabel.text = "\(counterHelper)"
            productTotalPrice = Double(1 * productPrice)
            decreaseTotalPrice?(productTotalPrice)
            removeFromCart(x: productItem)
            removeProduct?(productIndex ?? IndexPath())
        }else{
            counterLabel.endEditing(true)
        }
        
    }
    
}

