//
//  ContentView.swift
//  SmartShopping
//
//  Created by Chris Turner on 14/06/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@EnvironmentObject var viewRouter: ViewRouter
	@State var showPopUp = false
	@State var showAddItem = false
	@State var showAddLocation = false
	@State var showAddMeal = false
	@State var showAddMealItem = false
	
	
	var body: some View {
			GeometryReader { geometry in
					VStack {
						Spacer()
						if #available(iOS 15.0, *) {
							switch viewRouter.currentPage {
								case .list:
									ListView()
										.edgesIgnoringSafeArea(.bottom)
								case .meals:
									MealView(selectedMeal: Meal())
								case .locations:
									LocationView()
								case .settings:
									SettingsView()
								case .individualMeal:
									MealView(selectedMeal: Meal())
							}
						} else {
							// Fallback on earlier versions
						}
						Spacer()
							ZStack {
									if showPopUp {
//											PlusMenu(widthAndHeight: geometry.size.width/7)
//													.offset(y: -geometry.size.height/6)
									}
									HStack {
											TabBarIcon(viewRouter: viewRouter, assignedPage: .list, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "list.bullet", tabName: "List")
											TabBarIcon(viewRouter: viewRouter, assignedPage: .meals, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Meals")
											ZStack {
													Circle()
															.foregroundColor(.white)
															.frame(width: geometry.size.width/7, height: geometry.size.width/7)
															.shadow(radius: 4)
													Image(systemName: "plus.circle.fill")
															.resizable()
															.aspectRatio(contentMode: .fit)
															.frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
															.foregroundColor(Color("ButtonColor"))
															.rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
											}
													.offset(y: -geometry.size.height/8/2)
													.onTapGesture {
//															withAnimation {
//																	showPopUp.toggle()
//															}
														print("Add Button Tapped")
														print(viewRouter.currentPage)
														if viewRouter.currentPage == .list {
															showAddItem.toggle()
														} else if viewRouter.currentPage == .meals {
															showAddMeal.toggle()
														} else if viewRouter.currentPage == .locations {
															showAddLocation.toggle()
														} else if viewRouter.currentPage == .individualMeal {
															showAddMealItem.toggle()
														}

														
													}
													.sheet(isPresented: $showAddItem) {
														AddItemView()
													}
													.sheet(isPresented: $showAddMeal) {
														AddMealView()
													}
													.sheet(isPresented: $showAddLocation) {
														AddLocationView()
													}
													.sheet(isPresented: $showAddMealItem) {
														AddMealItemView()
													}
											TabBarIcon(viewRouter: viewRouter, assignedPage: .locations, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Locations")
											TabBarIcon(viewRouter: viewRouter, assignedPage: .settings, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Settings")
									}
											.frame(width: geometry.size.width, height: geometry.size.height/8)
									.background(Color("TabBarBackground").shadow(radius: 2))
							}
							
					}
							.edgesIgnoringSafeArea(.bottom)
			}
	}

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environmentObject(ViewRouter())

	}
}

//struct PlusMenu: View {
//
//	let widthAndHeight: CGFloat
//
//	var body: some View {
//		HStack(spacing: 50) {
//			ZStack {
//				Circle()
//					.foregroundColor(Color("ButtonColor"))
//					.frame(width: widthAndHeight, height: widthAndHeight)
//				Image(systemName: "record.circle")
//					.resizable()
//					.aspectRatio(contentMode: .fit)
//					.padding(15)
//					.frame(width: widthAndHeight, height: widthAndHeight)
//					.foregroundColor(.white)
//			}
//			.onTapGesture {
//				print("add tapped")
//			}
//			ZStack {
//				Circle()
//					.foregroundColor(Color("ButtonColor"))
//					.frame(width: widthAndHeight, height: widthAndHeight)
//				Image(systemName: "folder")
//					.resizable()
//					.aspectRatio(contentMode: .fit)
//					.padding(15)
//					.frame(width: widthAndHeight, height: widthAndHeight)
//					.foregroundColor(.white)
//			}
//		}
//		.transition(.scale)
//	}
//}

struct TabBarIcon: View {
	
	@StateObject var viewRouter: ViewRouter
	let assignedPage: Page
	let width, height: CGFloat
	let systemIconName, tabName: String
	
	
	
	var body: some View {
		VStack {
			Image(systemName: systemIconName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: width, height: height)
				.padding(.top, 10)
			
			Text(tabName)
				.font(.footnote)
			Spacer()
		}
		.padding(.horizontal, -4)
		.onTapGesture {
										 viewRouter.currentPage = assignedPage
	}
		.foregroundColor(viewRouter.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
}
}
