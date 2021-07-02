//
//  Item+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var tickedOnList: Bool
    @NSManaged public var itemLocation: Location?
    @NSManaged public var inMeal: Meal?
		@NSManaged public var isStaple : Bool
	
	public var wrappedItemName: String {
		itemName ?? "Unknown Item"
	}

}

extension Item : Identifiable {

}
