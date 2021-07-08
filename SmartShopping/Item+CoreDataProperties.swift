//
//  Item+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 08/07/2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var isStaple: Bool
    @NSManaged public var itemName: String?
    @NSManaged public var onShoppingList: Bool
    @NSManaged public var tickedOnList: Bool
    @NSManaged public var inMeal: NSSet?
    @NSManaged public var itemLocation: Location?
	
	public var wrappedItemName: String {
		itemName ?? "Unknown Item"
	}

}

// MARK: Generated accessors for inMeal
extension Item {

    @objc(addInMealObject:)
    @NSManaged public func addToInMeal(_ value: Meal)

    @objc(removeInMealObject:)
    @NSManaged public func removeFromInMeal(_ value: Meal)

    @objc(addInMeal:)
    @NSManaged public func addToInMeal(_ values: NSSet)

    @objc(removeInMeal:)
    @NSManaged public func removeFromInMeal(_ values: NSSet)

}

extension Item : Identifiable {

}
