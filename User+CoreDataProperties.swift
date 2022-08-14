//
//  User+CoreDataProperties.swift
//  ClothesStore
//
//  Created by macbook pro on 13/08/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var address: String?
    @NSManaged public var phoneNum: Int64
    @NSManaged public var identifier: Int64
    @NSManaged public var name: String?

}

extension User : Identifiable {

}
