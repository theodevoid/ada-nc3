//
//  CalendarRecCard.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI

struct CalendarRecCard: View {
    
    var recommendedLocation: RecommendedLocation
    var body: some View {
        ZStack{
            
            
            
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color(UIColor.tertiarySystemBackground))
                .frame(width: 353, height: 254)
                .shadow(radius: 4)
            
            VStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.clear)
                    .frame(width: 353, height: 144)
                    .background(
                        Image(recommendedLocation.location.locationName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 353, height: 144)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    )
                
                HStack {
                    VStack(alignment: .leading, spacing: 0){
                        Text("\(recommendedLocation.location.locationName),")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor.label))
                        Text(recommendedLocation.location.city)
                            .font(.title3)
                            .fontWeight(.medium)                            .foregroundColor(Color(UIColor.label))
                        Text("\(recommendedLocation.forecast.temperature.rounded())° | \(recommendedLocation.time)")
                            .foregroundColor(.secondary)
                            .foregroundColor(Color(UIColor.secondaryLabel))

                        
                    }
                    .padding()
                    Spacer()

                    
                    Image(systemName: "\(recommendedLocation.symbol).fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color(UIColor.label))
                        .frame(width: 49, height: 41)
                        .padding()
                }
                Spacer()
            }
            .padding()
            
        }
        .frame(width: 353, height: 254)
        .padding()
    }
}

