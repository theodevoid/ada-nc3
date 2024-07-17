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
        VStack(spacing: 0){
            VStack {
                Image(recommendedLocation.location.locationName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 393, height: 228)
            }.padding(.top, 20)
            
            VStack {
                VStack (alignment: .leading) {
                    HStack (alignment: .center) {
                        VStack (alignment: .leading){
                            Text(recommendedLocation.location.locationName)
                                .bold()
                                .font(.title2)
                                .lineLimit(1)
                            
                            Text(recommendedLocation.location.city)
                                .font(.title2)
                                .lineLimit(1)
                        }
                        Spacer()
                        Button(action: {
                            print("Bookmark")
                            if (contains(recommendedLocation)) {
                                removeData(recommendedLocation: recommendedLocation)
                            } else {
                                addData(recommendedLocation: recommendedLocation)
                            }
                        }, label: {
                            if (contains(recommendedLocation)) {
                                Image(systemName: "bookmark.fill")
                            } else {
                                Image(systemName: "bookmark")
                            }
                            
                        })
                        .foregroundStyle(.primary)
                    }.padding(.bottom, 5)
                    HStack {
                        Text("\(recommendedLocation.date.formatted(.dateTime.weekday(.abbreviated).month(.abbreviated).day().year(.twoDigits))) | \(hourString(time: recommendedLocation.time))")
                            .font(.system(size: 17))
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }.padding()
                
                HStack {
                    Text(recommendedLocation.location.desc!)
                }.frame(width: 323, height: 50).padding()
                
                VStack {
                    VStack {
                        HStack {
                            HStack {
                                Text(determineChanceOfRainCategory(chanceOfRain: recommendedLocation.forecast.chanceOfRain))
                                Spacer()
                                Text("\(Int(recommendedLocation.forecast.chanceOfRain))%")
                            }.frame(width: 168)
                            Spacer()
                        }.padding(.bottom, 1)
                        HStack {
                            HStack {
                                GradientLineCOR(recommendedLocation: recommendedLocation)
                                Text("Chance of Rain")
                            }
                            Spacer()
                        }
                    }
                    VStack {
                        HStack {
                            HStack {
                                Text(determineUVIndexCategory(uvIndex: recommendedLocation.forecast.uvIndex))
                                Spacer()
                                Text("\(recommendedLocation.forecast.uvIndex)")
                            }.frame(width: 168)
                            Spacer()
                        }.padding(.bottom, 1)
                        HStack {
                            HStack {
                                GradientLineUVI(recommendedLocation: recommendedLocation)
                                Text("UV Index")
                            }
                            Spacer()
                        }
                    }
                }.padding()
                
                
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
                                .bold()
                                .frame(width: 294)
                                .padding()
                                .background(Color.gold)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }.padding(.bottom, 10)
                    
                    Button(action: {
                        let map = recommendedLocation.location.map
                        if let url = URL(string: map){
                            UIApplication.shared.open(url)
                        }
                    }) {
                        
                        Text("Open in Maps")
                            .foregroundStyle(.blue)
                    }
                    
                    
                    
                }.padding(.bottom, 20).padding(.top, 20)
            }.background(Color(UIColor.systemBackground))
            
        }.navigationTitle(recommendedLocation.location.locationName)
            .background(Image("backgroundDarkLight").ignoresSafeArea())
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
    
    func addData(recommendedLocation: RecommendedLocation) {
        modelContext.insert(recommendedLocation)
        print(recommendedLocations)
    }
    
    // remove dr array
    func removeData(recommendedLocation: RecommendedLocation) {
        modelContext.delete(recommendedLocation)
        print(recommendedLocations)
    }
}

struct GradientLineCOR: View {
    
    var recommendedLocation : RecommendedLocation
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.teal, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing))
                .frame(width: 169, height: 9)
                .cornerRadius(10)
            Circle()
                .fill(Color.white)
                .frame(width: 7, height: 9)
                .offset(x: CGFloat(calculateOffSet(recommendedLocation: recommendedLocation)))
        }
    }
    
    func calculateOffSet(recommendedLocation: RecommendedLocation) -> Int {
        var offSet = recommendedLocation.forecast.chanceOfRain - 80
        return Int(offSet)
    }
}

struct GradientLineUVI: View {
    
    var recommendedLocation : RecommendedLocation
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.green, Color.yellow, Color.orange, Color.red, Color.pink]),
                    startPoint: .leading,
                    endPoint: .trailing))
                .frame(width: 169, height: 9)
                .cornerRadius(10)
            Circle()
                .fill(Color.white)
                .frame(width: 7, height: 9)
                .offset(x: CGFloat(calculateOffSet(recommendedLocation)))
        }
    }
    
    func calculateOffSet(_ recommendedLocation: RecommendedLocation) -> Int {
        var offSet = Int(recommendedLocation.forecast.uvIndex / 11 * 100) - 80
        return offSet

    }
}
