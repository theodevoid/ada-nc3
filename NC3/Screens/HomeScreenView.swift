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
                                Text("Saturday Picks:")
                                    .font(.system(size: 17))
                                    .bold()
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
                                Text("Sunday Picks:")
                                    .font(.system(size: 17))
                                    .bold()
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
        .background(Image("backgroundDarkLight").ignoresSafeArea())
    }
}

#Preview {
    HomeScreenView()
}
