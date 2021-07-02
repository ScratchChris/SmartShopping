//
//  ViewRouter.swift
//  SmartShopping
//
//  Created by Chris Turner on 15/06/2021.
//


import SwiftUI
import CoreData

class ViewRouter: ObservableObject {
	@Environment(\.managedObjectContext) var moc
	 
	@Published var currentPage: Page = .list
	
}

enum Page {
		 case list
		 case meals
		 case individualMeal
		 case locations
		 case settings
 }
