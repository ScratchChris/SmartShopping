//
//  ListView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

@available(iOS 15.0, *)
struct ListView: View {
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Location.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Location.locationName, ascending: true)
	])
	var locations: FetchedResults<Location>

	

	
//	@SectionedFetchRequest<Location?, Item>(
//		sectionIdentifier: \.itemLocation?, sortDescriptors: [
//			NSSortDescriptor(keyPath: \Item.itemName, ascending: true)
//		], animation: .default)
//	private var sectionedItems
	
	
//	var locations: FetchedResults<Location>
	
	var body: some View {
		NavigationView {
			List {
				ForEach(locations, id: \.self) { location in
					Section(header: Text(location.locationName!)) {
						ForEach(location.itemsAtLocationArray, id: \.self) { item in
								ItemCell(item: item)
									.swipeActions {
										//swipeactions
										Button {
											withAnimation {
												item.isStaple = true
											} } label : {
												Label("Pin",systemImage: "pin")
											}
									}
									.tint(.yellow)
									.onTapGesture {
										checkItem(item: item)
									}
						}
					}
				}
				
			}
			.navigationBarTitle("Shopping List")
		}
		.navigationBarItems(leading: EditButton())
	}

	
	func checkItem(item: Item) {
		
		item.tickedOnList.toggle()
		print(String("\(item.itemName)"))
		print(item.tickedOnList)
		try? moc.save()
	}
	
	
}

struct ListView_Previews: PreviewProvider {
	static var previews: some View {
	
		if #available(iOS 15.0, *) {
			ListView()
		} else {
			// Fallback on earlier versions
		}

	}
}
