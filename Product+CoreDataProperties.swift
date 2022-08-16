//
//  Product+CoreDataProperties.swift
//  ClothesStore
//
//  Created by Seif Awad on 8/14/22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var prodDescription: String?
    @NSManaged public var price: Int64
    @NSManaged public var image: String?
    @NSManaged public var size: String?
    @NSManaged public var color: String?
    @NSManaged public var isAddedToCart: Bool
    @NSManaged public var prodCount: Int64
    @NSManaged public var productNumber: Int64

}

extension Product : Identifiable {

}
