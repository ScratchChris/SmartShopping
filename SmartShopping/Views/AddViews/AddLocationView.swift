//
//  AddLocationView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct AddLocationView: View {
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode
	
	@State private var locationName = ""
	
	var body: some View {
		VStack {
			Text("Use the below form to add a new kitchen location to SmartShopping")
				.padding()
			Form {
				TextField("Location", text: $locationName)
				Section {
					Button("Save") {
						let newLocation = Location(context: self.moc)
						newLocation.locationName = self.locationName
						newLocation.itemsAtLocation = nil
						
						try? self.moc.save()
						self.presentationMode.wrappedValue.dismiss()
					}
				}
			}
		}
	}
}

struct AddLocationView_Previews: PreviewProvider {
	static var previews: some View {
		AddLocationView()
	}
}
