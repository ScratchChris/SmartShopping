//
//  MealCell.swift
//  SmartShopping
//
//  Created by Chris Turner on 18/06/2021.
//

import SwiftUI

struct MealCell: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@ObservedObject var meal: Meal
	@State var isShowingMealItems: Bool = false
	
	var body: some View {
		
		
			HStack {
				Text(meal.wrappedMealName)
					.onTapGesture {
						checkMeal(meal: meal)
						print("button pressed")
					}
				Spacer()
				if meal.mealTicked == true {
					
					Image(systemName: "checkmark")
				}
				
			}

	}
	
	func checkMeal(meal: Meal) {
		
		meal.mealTicked.toggle()
		let selectedItems = meal.itemsInMeal?.allObjects as! [Item]
		for item in selectedItems {
			item.onShoppingList.toggle()
		}
		
		try? moc.save()
	}
	
}

struct MealCell_Previews: PreviewProvider {
	static var previews: some View {
		MealCell(meal : Meal())
	}
}
