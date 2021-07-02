//
//  MealItemView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct MealItemView: View {
	
	
	init(selectedMeal : Meal) {
		self.meal = selectedMeal
		self.mealRequest = FetchRequest<Item>(entity: Item.entity(), sortDescriptors: [
			NSSortDescriptor(keyPath: \Item.itemName, ascending: true)
	 ], predicate: NSPredicate(format : "inMeal == %@", meal))
		
		
	}
	
	@Environment(\.managedObjectContext) var moc
	@EnvironmentObject var viewRouter: ViewRouter
	
	var meal: Meal
	var mealRequest : FetchRequest<Item>
	var itemsInMeal:  FetchedResults<Item>{mealRequest.wrappedValue}
	
//	@FetchRequest(entity: Item.entity(), sortDescriptors: [
//		NSSortDescriptor(keyPath: \Item.itemName, ascending: true)
//	], predicate: NSPredicate(format : "inMeal == %@", meal))
	
	var body: some View {
		List {
			ForEach(itemsInMeal, id: \.itemName) { item in
				Text(item.itemName!)
			}
		}
		.navigationBarTitle("\(meal.mealName!) Ingredients",displayMode: .inline)
	}
	
}

struct MealItemView_Previews : PreviewProvider {
	static var previews: some View {
		ListView()
	}
}
