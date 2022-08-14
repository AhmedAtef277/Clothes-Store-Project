//
//  DetailsVC.swift
//  ClothesStore
//
//  Created by mac on 11/08/2022.
//

import UIKit

class DetailsVC: UIViewController {
    
// MARK: OUTLETS
    @IBOutlet var sizeButtons: [UIButton]!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var favouriteButton: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var grayColor: UIButton!
    @IBOutlet weak var yellowColor: UIButton!
    @IBOutlet weak var cyanColor: UIButton!
    @IBOutlet weak var pinkColor: UIButton!
    
    @IBOutlet weak var xsSize: UIButton!
    @IBOutlet weak var sSize: UIButton!
    @IBOutlet weak var mSize: UIButton!
    @IBOutlet weak var lSize: UIButton!
    @IBOutlet weak var xlSize: UIButton!
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updataUi()
        
    }
    // MARK: IBActions
    

    // MARK: functions
   private func updataUi(){
        [grayColor,yellowColor,cyanColor,pinkColor].forEach { button in
            button?.addTarget(self, action: #selector(selectColorButton(sender:)), for: .touchUpInside)
        }
        [xsSize,sSize,mSize,lSize,xlSize].forEach { button in
            button?.addTarget(self, action: #selector(selectSizeButton(sender:)), for: .touchUpInside)
        }
        sizeButtonsProperties()
        detailsViewProperties()
    }
    @objc func selectColorButton(sender : UIButton){
         setColorButtonsUnselected()
        sender.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
    }
    @objc func selectSizeButton(sender : UIButton){
        setSizeButtonsUnselected()
        sender.backgroundColor = .yellow
    }
    
    private func sizeButtonsProperties(){
        for sizeButton in self.sizeButtons {
            sizeButton.layer.cornerRadius = sizeButton.frame.width / 2
        }
    }
    
    private func detailsViewProperties(){
        self.detailsView.layer.cornerRadius = 30
        self.detailsView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
    }

    
    private func setColorButtonsUnselected(){
        
        [grayColor,yellowColor,cyanColor,pinkColor].forEach { button in
            button?.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    private func setSizeButtonsUnselected(){
        
        [xsSize,sSize,mSize,lSize,xlSize].forEach { button in
            button?.backgroundColor = .systemGray6
            
        }
    }
    
    }



