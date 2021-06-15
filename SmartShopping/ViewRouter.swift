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
	 
	@Published var currentPage: Page = .home
	
}

enum Page {
		 case home
		 case liked
		 case records
		 case user
 }
