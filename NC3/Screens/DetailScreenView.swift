//
//  DetailScreenView.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI
import SwiftData

struct DetailScreenView: View {
    
    @Query private var recommendedLocations: [RecommendedLocation]
    @Environment(\.modelContext) private var modelContext
    
    private let event = EventManager()
    
    var recommendedLocation : RecommendedLocation
    
    private func determineChanceOfRainCategory(chanceOfRain: Double) -> String {
        if (chanceOfRain < 30) {
            return "Low"
        } else if (chanceOfRain > 60) {
            return "High"
        } else {
            return "Medium"
        }
    }
    
    private func determineUVIndexCategory(uvIndex: Int) -> String {
        if (uvIndex < 2) {
            return "Low"
        } else if (2 < uvIndex && uvIndex < 6) {
            return "Moderate"
        } else if (5 < uvIndex && uvIndex < 8){
            return "High"
        } else {
            return "Very High"
        }
    }
    
    private func hourString(time: RecommendedLocationTime) -> String {
        if (time == .morning) {
            return "06:00 - 08.00 AM"
        } else {
            return "16:00 - 18.00 AM"
        }
    }
    
    var body: some View {
        VStack{
            Image("TebetEcoPark")
                .resizable()
                .scaledToFit()
            
            HStack (alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(recommendedLocation.location.locationName), \(recommendedLocation.location.city)")
                        .bold()
                        .font(.title2)
                        .lineLimit(1)
                    Text("\(DateFormatter.localizedString(from: recommendedLocation.date, dateStyle: .medium, timeStyle: .none)) | \(hourString(time: recommendedLocation.time))")
                }
                
                Spacer()
                
                Button(action: {
                    print("Bookmark")
                    if (contains(recommendedLocation)) {
                        remove(recommendedLocation)
                    } else {
                        add(recommendedLocation)
                    }
                }, label: {
                    if (contains(recommendedLocation)) {
                        Image(systemName: "bookmark.fill")
                    } else {
                        Image(systemName: "bookmark")
                    }
                    
                })
                .foregroundStyle(.primary)
            }
            .padding()
            
            Text("Discover the perfect blend of nature and play at Tebet Eco Park! Enjoy scenic trails, vibrant playgrounds, and relaxing picnic spots. Explore interactive environmental exhibits for an educational and fun family outing.")
            
            Spacer()
            
            // PAKE GRID / WRAPPING
            
            HStack (alignment: .bottom) {
                Spacer()
                VStack {
                    Image(systemName: "cloud.rain")
                        .frame(height: 25)
                    Text(determineChanceOfRainCategory(chanceOfRain: recommendedLocation.forecast.chanceOfRain))
                        .bold()
                    Text("Chance of Rain")
                        .font(.subheadline)
                }
                Spacer()
                VStack {
                    Image(systemName: "sun.max")
                        .frame(height: 25)
                    Text(determineUVIndexCategory(uvIndex: recommendedLocation.forecast.uvIndex))
                        .bold()
                    Text("UV Index")
                        .font(.subheadline)
                }
                Spacer()
                VStack {
                    Image(systemName: recommendedLocation.symbol)
                        .frame(height: 25)
                    Text("\(Int(recommendedLocation.forecast.temperature))°")
                        .bold()
                    Text("Temperature")
                        .font(.subheadline)
                }
                Spacer()
            }.padding()
            
            Spacer()
            
            VStack {
                Button(action: {
                    if (event.bool) {
                        
                    } else {
                        event.requestAccessAndSaveEvent(title: recommendedLocation.location.locationName, date: recommendedLocation.date, time: recommendedLocation.time)
                    }
                }) {
                    if (event.bool) {
                        Text("Disabled")
                            .frame(width: 294)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    } else {
                        Text("Add to Calendar")
                            .frame(width: 294)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }.padding(.bottom, 10)
                
                Button(action: {
                }) {
                    Text("Open in Maps")
                }
                
            }.padding(.bottom, 20)
            
        }.navigationTitle(recommendedLocation.location.locationName)
                    .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func contains(_ recommendedLocation: RecommendedLocation) -> Bool {
        for recLoc in recommendedLocations {
            return recLoc.id == recommendedLocation.id
            if ((recLoc.location.locationName == recommendedLocation.location.locationName) && (recLoc.time == recommendedLocation.time)) {
                print("ada")
                return true
            }
        }
        print("gaada")
        return false
        
    }
    
    func add(_ recommendedLocation: RecommendedLocation) {
        modelContext.insert(recommendedLocation)
    }
    
    // remove dr array
    func remove(_ recommendedLocation: RecommendedLocation) {
        do {
            print("remove", recommendedLocation.location.locationName)
            modelContext.delete(recommendedLocation)
            
            try modelContext.save()
            
            print("after delete")
            for recommendedLocation in recommendedLocations {
                print(recommendedLocation.location.locationName)
            }
        } catch {
            print("eak")
        }
        
    }
    
}
