//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI

struct DetailScreenView: View {
    
    var body: some View {
        
        // Ini buat Home Screen View
        NavigationStack {
            VStack {
                NavigationLink(destination: DetailView()) {
                    Text("Tebet Eco Park")
                }
            }
            .navigationTitle("Weekend Adventures")
        }
    }
}

struct DetailView: View {
    
//    let currentLocation = Recommendation().locations[1]
//    let date = "2024/07/20 06:00"
//    
//    let event = EventManager()

    // Ini yang dipindahin ke struct DetailScreenView
    
    var body: some View {
        VStack {
            Image("Tebet Eco Park")
                .resizable()
                .scaledToFit()
            
            VStack (alignment: .leading) {
                HStack {
                    Text("Tebet Eco Park,")
                        .bold()
                        .font(.title2)
                    Text("Jakarta")
                        .font(.title2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Saturday, 13 July")
                    Text("|")
                    Text("10:00 AM")
                }.padding(.bottom, 20)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            }
            .padding()
            
            Spacer()
                
            HStack (alignment: .bottom) {
                Spacer()
                VStack {
                    Image(systemName: "cloud.drizzle")
                        .frame(height: 25)
                    Text("Low")
                        .bold()
                    Text("Chance of Rain")
                        .font(.subheadline)
                }
                Spacer()
                VStack {
                    Image(systemName: "wind")
                        .frame(height: 25)
                    Text("Unhealthy")
                        .bold()
                    Text("Air Quality Index")
                        .font(.subheadline)
                }
                Spacer()
                VStack {
                    Image(systemName: "thermometer.medium")
                        .frame(height: 25)
                    Text("Safe")
                        .bold()
                    Text("UV Index")
                        .font(.subheadline)
                }
                Spacer()
            }.padding()
                
            Spacer()
            
            VStack {
                Button(action: {
//                    event.requestAccessAndSaveEvent(title: currentLocation.locationName, date: date)
                }) {
                    Text("Add to Calendar")
                        .frame(width: 294)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding(.bottom, 10)
                Button(action: {
                }) {
                    Text("Open in Maps")
                }
            }.padding(.bottom, 20)
            
            
        
        }
        .navigationTitle("Tebet Eco Park")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailScreenView()
}
