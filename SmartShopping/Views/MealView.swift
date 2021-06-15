//
//  MealView.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//

import SwiftUI
import CoreData

struct MealView: View {
    var body: some View {
			NavigationView {
			List {
        Text("Meals")
				Text("Hello, World!")
				Text("Hello, World!")
				Text("Hello, World!")
			}
			.navigationBarTitle("Meals")
			
    }
			
		}
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
