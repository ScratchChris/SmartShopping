//
//  AddMealView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI

struct AddMealView: View {
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode
	
	@State var mealName = ""
	
	var body: some View {
		VStack {
			Text("Use the below form to add a new meal to your list")
				.padding()
			Form {
				TextField("Meal Name", text: $mealName)
				
				Section {
					Button("Save") {
						let newMeal = Meal(context: self.moc)
						newMeal.mealName = self.mealName
						newMeal.itemsInMeal = nil
						
						try? self.moc.save()
						self.presentationMode.wrappedValue.dismiss()
					}
				}
			}
		}
	}
}


struct AddMealView_Previews: PreviewProvider {
	static var previews: some View {
		AddMealView()
	}
}
