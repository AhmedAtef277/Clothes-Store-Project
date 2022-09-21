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
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
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
    @IBOutlet weak var inctreaseCounter: UIButton!
    
    @IBOutlet weak var decreaseCounter: UIButton!
    @IBOutlet weak var productCount: UILabel!
    
    
    // MARK: View life cycle
    
    
    var productDetails = Product()
    var productNumber : Int = 0
    var selectedProductColor = "red"
    var selectedProductSize = "L"
    private var productCountValue = 0 {
        didSet{
            productCount.text = "\(productCountValue)"
        }
    }
    
    private var productPriceValue = 0 {
        didSet{
            productPrice.text = "Price : \(productPriceValue)"

        }
    }
    
    //    init(productDetails : Product = Product()) {
    //        self.productDetails = productDetails
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerView()
        updataUi()
        
    }
    
    
    // MARK: functions
    
    private func configuerView(){
        productCountValue = 1
        productImage.image = UIImage(named: productDetails.image ?? "")
        productName.text = productDetails.name
        productDescription.text = productDetails.prodDescription
        productPriceValue = Int(productDetails.price)
    }
    
    private func updataUi(){
        [grayColor,yellowColor,cyanColor,pinkColor].forEach { button in
            button?.addTarget(self, action: #selector(selectColorButton(sender:)), for: .touchUpInside)
        }
        [xsSize,sSize,mSize,lSize,xlSize].forEach { button in
            button?.addTarget(self, action: #selector(selectSizeButton(sender:)), for: .touchUpInside)
        }
        sizeButtonsProperties()
        detailsViewProperties()
        
        [inctreaseCounter,decreaseCounter].forEach { button in
            button?.layer.cornerRadius = (button?.frame.width)! / 2
            button?.layer.borderColor = UIColor.darkGray.cgColor
            button?.layer.borderWidth = 0.8     }
    }
    @objc func selectColorButton(sender : UIButton){
        selectedProductColor = sender.accessibilityIdentifier ?? "red"
        setColorButtonsUnselected()
        sender.setImage(UIImage(named: "pinkColor"), for: .normal)
    }
    @objc func selectSizeButton(sender : UIButton){
        selectedProductSize = sender.accessibilityIdentifier ?? "L"
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
    
    // MARK: IBActions
    
    
    @IBAction func decreaseProductCountButton(_ sender: Any) {
        guard productCountValue > 1 else{
            return
        }
        productCountValue -= 1
        productPriceValue -= Int(productDetails.price )
        removeFromCart(x: productDetails)
    }
    
    @IBAction func increaseProductCountButton(_ sender: Any) {
        productCountValue += 1
        productPriceValue += Int(productDetails.price )
        addToCart(x: productDetails)
    }
    
    
    
    
    @IBAction func addToCartButton(_ sender: Any) {
        updateColor(productNumber: productNumber, productColor: selectedProductColor)
        updateSize(productNumber: productNumber, productSize: selectedProductSize)
        addToCart(x: productDetails)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}



