//
//  ItemCell.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct ItemCell: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@ObservedObject var item: Item
	
	var body: some View {
		HStack {
			VStack {
				
					item.isStaple ? Image(systemName: "s.square.fill")
						.foregroundColor(.yellow)
					: Image(systemName: "n.square.fill")
						.foregroundColor(.green)
				
				if item.inMeal != nil
				{
					Image(systemName: "m.square.fill")
					.foregroundColor(.blue)
					
				}
				
			}
		Text(item.wrappedItemName)
			Spacer()
		if item.tickedOnList == true {
			Image(systemName: "checkmark")
		}
		else {
		}
		}
	}
}

struct ItemCell_Previews: PreviewProvider {
	static var previews: some View {
		ItemCell(item: Item())
	}
}
