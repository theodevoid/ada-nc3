//
//  HomeScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .color1, location: 0.00),
                    Gradient.Stop(color: .color2, location: 1.00),
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
                                    Gradient.Stop(color: .color1.opacity(0.5), location: 0.00),
                                    Gradient.Stop(color: .color2.opacity(0.5), location: 1.00),
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
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                ScrollView {
                    RecommendationView(items: viewModel.model, index: $viewModel.currentIndex)
                    Spacer()
                    ZStack {
                        VStack{
                            Rectangle()
                                .foregroundColor(.container)
                                .frame(width: 393.00003, height: 1140)
                                .cornerRadius(40)
                        }
                        VStack {
                            HStack() {
                                Spacer()
                                Picker("Pick", selection: $viewModel.selectedSide) {
                                    Text("Morning").tag("Morning")
                                    Text("Afternoon").tag("Afternoon")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .frame(width: 175)
                                Spacer()
                            }
                            .padding(.top, 15)
                            VStack (alignment: .leading){
                                HStack {
                                    Text("Saturday ")
                                        .font(.system(size: 17))
                                        .bold() +
                                    Text("Picks:")
                                        .font(.system(size: 17))
                                    Spacer()
                                    Text("See More")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.orange)
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                let (nextSaturday, _) = Date.nearestWeekend(from: Date())
                                Text(viewModel.formatDate(date: nextSaturday))                    .font(Font.custom("SF Pro", size: 16))
                                    .padding(.horizontal, 20)
                            }
                            .padding(.vertical, 10)
                            WeekendView(items: viewModel.filteredSaturdayRecommendations, index: $viewModel.currentIndex)
                            VStack (alignment: .leading){
                                HStack {
                                    Text("Sunday ")
                                        .font(.system(size: 17))
                                        .bold() +
                                    Text("Picks:")
                                        .font(.system(size: 17))
                                    Spacer()
                                    Text("See More")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.orange)
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 5)
                                let (_, nextSunday) = Date.nearestWeekend(from: Date())
                                Text(viewModel.formatDate(date: nextSunday))                    .font(Font.custom("SF Pro", size: 16))
                                    .padding(.horizontal, 20)
                            }
                            .padding(.vertical, 10)
                            WeekendView(items: viewModel.filteredSundayRecommendations, index: $viewModel.currentIndex)
                            Spacer()
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    HomeScreenView()
}
