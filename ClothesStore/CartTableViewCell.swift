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
    var counterHelper = 0
    
    
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
    }
    func setUpCell(model : Model){
        productImage.image = model.image
        priceLabel.text = "\(model.price)"
        descreptionLabel.text = model.descreption
    }

    // MARK: IBAtions
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        counterHelper += 1
        counterLabel.text = "\(counterHelper)"
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        
        if counterHelper >= 1 {
        counterHelper -= 1
        counterLabel.text = "\(counterHelper)"
        }else{
            counterLabel.endEditing(true)

        }

    }
    
}
