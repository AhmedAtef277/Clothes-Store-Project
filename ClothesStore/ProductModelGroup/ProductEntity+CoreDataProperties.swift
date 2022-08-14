//
//  ProductEntity+CoreDataProperties.swift
//  ClothesStore
//
//  Created by Seif Awad on 8/12/22.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var clothName: [String]?
    @NSManaged public var clothPrice: [String]?
    @NSManaged public var imageName: [String]?
    

}

extension ProductEntity : Identifiable {

}
