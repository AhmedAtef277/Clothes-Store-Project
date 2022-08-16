//
//  productCoreDataFns.swift
//  ClothesStore
//
//  Created by Seif Awad on 8/14/22.
//

import Foundation

var products:[Product] = []

// Access Shared Defaults Object
//let userDefaults = UserDefaults.standard

// Read Boolean
//var value = userDefaults.value()(forKey: false)

func productsExists()->Bool
{
    do
    {
    products = try  context.fetch(Product.fetchRequest())
        if(products.count == 0)
        {
            return false
        }
        else{
            return true
        }
} catch  {  }
    return false

}
var prodInserted = false
func addProductsToCoreData()
{
    let newProduct = Product(context: context)
    //first product
    newProduct.name = "Waffle Drop"
    newProduct.price = 120
    newProduct.image = "waffleDropImage1"
    newProduct.size = "S"
    newProduct.isAddedToCart = false
    newProduct.prodCount = 0
    newProduct.prodDescription = "Men's High Quality T-Shirt!"
    newProduct.color = "blue";
    newProduct.productNumber = 0
    
    let newProduct2 = Product(context: context)
    //second product
    newProduct2.name = "Striped Shirt"
    newProduct2.price = 90
    newProduct2.image = "stripedShirtImage2"
    newProduct2.size = "S"
    newProduct2.isAddedToCart = false
    newProduct2.prodCount = 0
    newProduct2.prodDescription = "Men's High Quality Striped Shirt!"
    newProduct2.color = "blue";
    newProduct2.productNumber = 1
    
    let newProduct3 = Product(context: context)
    //third product
    newProduct3.name = "Oversized White T"
    newProduct3.price = 100
    newProduct3.image = "oversizeWhiteTImage3"
    newProduct3.size = "S"
    newProduct3.isAddedToCart = false
    newProduct3.prodCount = 0
    newProduct3.prodDescription = "Men's High Quality Oversized T-Shrit from the Oversized Collection!"
    newProduct3.color = "blue";
    newProduct3.productNumber = 2
    
    let newProduct4 = Product(context: context)
    //fourth product
    newProduct4.name = "Half Sleeve Shirt"
    newProduct4.price = 110
    newProduct4.image = "brownHalfSleeveImage4"
    newProduct4.size = "S"
    newProduct4.isAddedToCart = false
    newProduct4.prodCount = 0
    newProduct4.prodDescription = "Authentic Men's Half Sleeve Shirt from the new collection!"
    newProduct4.color = "blue";
    newProduct4.productNumber = 3
    
    do
    {
            try context.save()
        let products = try  context.fetch(Product.fetchRequest())
        print("Products count = \(products.count)")
    } catch { }
    prodInserted = true
}

func getData()
{
    
    do
    {
    products = try  context.fetch(Product.fetchRequest())
    print("users count = \(products.count)")
        
} catch  {  }
}

//parameters are product number which is 0 1 2 3 based on how many products there are
//and the size you want to change for the product
func updateSize(productNumber: Int, productSize: String )  {
    let product = products[productNumber]
     product.size = productSize
    
     do {
     try context.save()
     } catch {

     }
 
}

func updateColor(productNumber: Int, productColor: String )  {
    let product = products[productNumber]
    product.color = productColor
    
     do {
     try context.save()
     } catch {

     }
 
}

func addToCart(x: Product)  {
    
    x.isAddedToCart = true
    
    x.prodCount = x.prodCount + 1
    
    print(x.prodCount)
     do {
     try context.save()
     } catch {

     }
 
}

func removeFromCart(x: Product)  {
    
    if(x.isAddedToCart) {
    x.prodCount = x.prodCount - 1
  
        
    }
    else {
        print("This product does not exist in the cart")
    }
    
    if(x.prodCount == 0){
        x.isAddedToCart = false
    }
    
    print(x.prodCount)
    
     do {
     try context.save()
     } catch {

     }
 
}



func queryCart() -> [Product] {
    
    var cartProducts:[Product] = []
    //the products in the cart
    
    
    
    do {
     products = try
    context.fetch(Product.fetchRequest())
        
        for product in products {
            if(product.isAddedToCart){
                
                cartProducts.append(product)
                
                
            }
        }
        


     } catch { }
    
    
    return cartProducts
}


func zeroCart() {
    for product in products {
        product.isAddedToCart = false
        product.prodCount = 0

        
    }
    
    

     do {
     try context.save()
     } catch {

     }
}


