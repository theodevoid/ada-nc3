//
//  BookmarkScreenView.swift
//  NC3
//
//  Created by Gracella Noveliora on 17/07/24.
//

import SwiftUI
import SwiftData

struct BookmarkScreenView: View {
    
    @Query private var recommendedLocations: [RecommendedLocation]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Bookmarks")
                        .font(.title)
                        .bold()
                    Spacer()
                }.padding()
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 393, height: 675)
                        .cornerRadius(25)
                        .foregroundColor(Color(UIColor.systemBackground))
                    
                    VStack {
                        HStack {
                            Text("Your Bookmarks")
                                .bold()
                            Spacer()
                        }.padding().padding(.top, 20)
                        
                        
                        List (recommendedLocations) { recLoc in
                            NavigationLink(destination: DetailScreenView(recommendedLocation: recLoc)) {
                                VStack(alignment: .leading) {
                                    Text(recLoc.location.locationName)
                                        .font(.headline)
                                    Text("\(recLoc.date.formatted(.dateTime.weekday(.abbreviated).month(.abbreviated).day().year(.twoDigits))) | \(hourString(time: recLoc.time))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }.listStyle(.plain)
                    }
                    
                    //                    Spacer()
                    
                }
            }.background(
                Image("backgroundDarkLight")
                    .resizable()
                    .ignoresSafeArea()
                )
            
        }
        
    }
    
    private func hourString(time: RecommendedLocationTime) -> String {
        if (time == .morning) {
            return "06:00 - 08.00 AM"
        } else {
            return "16:00 - 18.00 AM"
        }
    }
}

#Preview {
    BookmarkScreenView()
}



