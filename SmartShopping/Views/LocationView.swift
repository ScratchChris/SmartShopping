//
//  LocationView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct LocationView: View {
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(entity: Location.entity(), sortDescriptors: [
		NSSortDescriptor(keyPath: \Location.locationName, ascending: true)
	]) var locations: FetchedResults<Location>
	
    var body: some View {
			List {
				ForEach(locations, id: \.locationName) { location in
					Text(location.locationName!)
				}
			}
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
