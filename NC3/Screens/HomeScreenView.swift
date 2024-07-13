//
//  HomeScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State var currentIndex: Int = 0
    
    @State var model: [Location] = []
    @State var selectedSide: String = "Morning"
    
    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.91, green: 0.79, blue: 0.5), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.81, green: 0.55, blue: 0.32), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Circle()
                        .fill(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.91, green: 0.79, blue: 0.5).opacity(0.5), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.81, green: 0.55, blue: 0.32).opacity(0.5), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )                        )
                        .frame(width: 232, height: 232)
                }
                Spacer()
            }
            .padding(.vertical, -26)
            .padding(.horizontal, -45)
            .ignoresSafeArea()
            
            VStack (alignment: .leading){
                Text("Weekend Adventures")
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                ScrollView {
                    VStack() {
                        Text("Featured Places:")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.63, green: 0.43, blue: 0.16))
                            .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    RecommendationView(items: model, index: $currentIndex)
                    Spacer()
                    ZStack {
                        VStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 393.00003, height: 459.99997)
                                .cornerRadius(40)
                        }
                        VStack(alignment: .leading) {
                            HStack() {
                                Spacer()
                                Picker("Pick", selection: $selectedSide) {
                                    Text("Morning")
                                    Text("Evening")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 175)
                                Spacer()
                            }
                            .padding(.top, 10)
                            HStack {
                                Text("Saturday ")
                                    .font(.system(size: 17))
                                    .bold() +
                                Text("Picks:")
                                    .font(.system(size: 17))
                                Spacer()
                                Text("See More")
                                    .font(Font.custom("SF Pro", size: 15))
                                    .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                            Text("20 July 2024")
                                .font(Font.custom("SF Pro", size: 12))
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                            WeekendView(items: model, index: $currentIndex)
                            HStack {
                                Text("Sunday ")
                                    .font(.system(size: 17))
                                    .bold() +
                                Text("Picks:")
                                    .font(.system(size: 17))
                                Spacer()
                                Text("See More")
                                    .font(Font.custom("SF Pro", size: 15))
                                    .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                            Text("20 July 2024")
                                .font(Font.custom("SF Pro", size: 12))
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                            WeekendView(items: model, index: $currentIndex)
                            Spacer()
                        }
                    }
                }
                .onAppear {
                    //DUMMY DATA
                    model = Recommendation().getLocations()
                }
            }
            
        }
        
    }
}

#Preview {
    HomeScreenView()
}
