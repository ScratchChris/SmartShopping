//
//  Location+CoreDataProperties.swift
//  SmartShopping
//
//  Created by Chris Turner on 08/07/2021.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var locationName: String?
    @NSManaged public var itemsAtLocation: NSSet?
	
	public var wrappedLocationName: String {
		locationName ?? "Unknown Country"
	}
	
	public var itemsAtLocationArray: [Item] {
		let set = itemsAtLocation as? Set<Item> ?? []
		
		return set.sorted {
			$0.wrappedItemName < $1.wrappedItemName
		}
	}

}

// MARK: Generated accessors for itemsAtLocation
extension Location {

    @objc(addItemsAtLocationObject:)
    @NSManaged public func addToItemsAtLocation(_ value: Item)

    @objc(removeItemsAtLocationObject:)
    @NSManaged public func removeFromItemsAtLocation(_ value: Item)

    @objc(addItemsAtLocation:)
    @NSManaged public func addToItemsAtLocation(_ values: NSSet)

    @objc(removeItemsAtLocation:)
    @NSManaged public func removeFromItemsAtLocation(_ values: NSSet)

}

extension Location : Identifiable {

}
