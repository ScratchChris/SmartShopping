//
//  ShoppingTrip+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//
//

import Foundation
import CoreData


extension ShoppingTrip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingTrip> {
        return NSFetchRequest<ShoppingTrip>(entityName: "ShoppingTrip")
    }

    @NSManaged public var dateOfShop: Date?

}

extension ShoppingTrip : Identifiable {

}
