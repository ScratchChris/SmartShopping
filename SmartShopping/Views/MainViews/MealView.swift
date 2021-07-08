//
//  MealView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct MealView: View {
	
	@EnvironmentObject var viewRouter : ViewRouter
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Meal.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Meal.mealName, ascending: true)
	])
	
	var meals: FetchedResults<Meal>
	
	@State var isShowingMealItemsView = false
	@State var selectedMeal : Meal
	
	var body: some View {
		NavigationView {
			
			if #available(iOS 15.0, *) {
				List {
					ForEach(meals, id: \.self) { meal in
						
							MealCell(meal: meal)
								.swipeActions(edge: .leading) {
									//swipeactions
									
									Button ("Edit") {
										editButtonPressed(meal: meal)
									}
									.tint(.green)
								}
					}
				}
				.navigationBarTitle("Meals")
				.background(
					NavigationLink(destination: MealItemView(selectedMeal: selectedMeal),isActive: $isShowingMealItemsView) {
					EmptyView()
				}
						.hidden()
				)
			}
			else {
				// Fallback on earlier versions
			}
			
			
			
		}
		
		
		
	}
	
	func editButtonPressed(meal: Meal) {
		selectedMeal = meal
		viewRouter.selectedMeal = meal
		print(isShowingMealItemsView)
		self.isShowingMealItemsView = true
		print(isShowingMealItemsView)
		viewRouter.currentPage = .individualMeal
		print("editbuttonpressed")
	}
	
}

struct MealView_Previews: PreviewProvider {
	static var previews: some View {
		MealView(selectedMeal: Meal())
	}
}
