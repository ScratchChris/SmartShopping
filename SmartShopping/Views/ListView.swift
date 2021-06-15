//
//  ListView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct ListView: View {
	
	@Environment(\.managedObjectContext) var moc
	
    var body: some View {
			NavigationView {
			List {
					Text("Hello World")
					Text("Hello World")
					Text("Hello World")
			}
			.navigationBarTitle("List")
			}
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
