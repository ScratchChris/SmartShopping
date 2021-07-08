//
//  Meal+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 08/07/2021.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var mealName: String?
    @NSManaged public var mealTicked: Bool
    @NSManaged public var itemsInMeal: NSSet?

	public var wrappedMealName: String {
		mealName ?? "Unknown Item"
	}
	
	
}

// MARK: Generated accessors for itemsInMeal
extension Meal {

    @objc(addItemsInMealObject:)
    @NSManaged public func addToItemsInMeal(_ value: Item)

    @objc(removeItemsInMealObject:)
    @NSManaged public func removeFromItemsInMeal(_ value: Item)

    @objc(addItemsInMeal:)
    @NSManaged public func addToItemsInMeal(_ values: NSSet)

    @objc(removeItemsInMeal:)
    @NSManaged public func removeFromItemsInMeal(_ values: NSSet)

}

extension Meal : Identifiable {

}
