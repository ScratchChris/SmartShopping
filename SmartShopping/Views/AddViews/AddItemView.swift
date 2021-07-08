//
//  AddItemView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct AddItemView: View {
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode

	@FetchRequest(entity: Location.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Location.locationName, ascending: true)
	]) var locations: FetchedResults<Location>
	
	@State var selection = Location()
	
	@State var itemName = ""
	
	
	var body: some View {
		VStack {
			Text("Use the below form to add a new item to your list")
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
					newItem.onShoppingList = true
					newItem.inMeal = nil
					
					try? self.moc.save()
					self.presentationMode.wrappedValue.dismiss()
				}
			}
		}
	}
		.onAppear(perform : onAppear)
}
	
	func onAppear() {
		print(locations.count)
		selection = locations[0]
	}
	
}


struct AddItemView_Previews: PreviewProvider {
	static var previews: some View {
		AddItemView(selection: Location())
	}
}
