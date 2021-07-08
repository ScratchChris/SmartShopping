//
//  AddMealItem.swift
//  SmartShopping
//
//  Created by Chris Turner on 28/06/2021.
//

import SwiftUI
import CoreData

struct AddMealItemView: View {
	
	@EnvironmentObject var viewRouter : ViewRouter
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode

	@FetchRequest(entity: Location.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Location.locationName, ascending: true)
	]) var locations: FetchedResults<Location>
	
	@State var selection = Location()
	@State var itemName = ""
	
	var body: some View {
		VStack {
			Text("Add Meal ITem VIEWWWWW")
			Text(viewRouter.selectedMeal!.mealName!)
				.padding()
			Form {
				TextField("Item Name", text: $itemName)
				
				Picker("Location", selection: $selection) {
					ForEach(locations) { (location: Location) in
						Text(location.locationName!).tag(location as Location)
					}
				}
				.pickerStyle(.wheel)
				
			
			Section {
				Button("Save") {
					let newItem = Item(context: self.moc)
					newItem.itemName = self.itemName
					newItem.itemLocation = self.selection
					newItem.addToInMeal(viewRouter.selectedMeal!)
					if viewRouter.selectedMeal!.mealTicked == true {
						newItem.onShoppingList = true
					} else {
						newItem.onShoppingList = false
					}
					
					try? self.moc.save()
					self.presentationMode.wrappedValue.dismiss()
//					viewRouter.currentPage = .meals
				}
			}
		}
	}
		.onAppear(perform : onAppear)
}
	
	func onAppear() {
		print(locations.count)
		print("Testy")
		selection = locations[0]
		viewRouter.currentPage = .individualMeal
	}
	
}


struct AddMealItemView_Previews: PreviewProvider {
	static var previews: some View {
		AddItemView(selection: Location())
	}
}
