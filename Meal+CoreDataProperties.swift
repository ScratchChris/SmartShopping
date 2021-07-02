//
//  Meal+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
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
    @NSManaged public var itemsInMeal: Item?

	public var wrappedMealName: String {
		mealName ?? "Unknown Item"
	}
	
}

extension Meal : Identifiable {

}
