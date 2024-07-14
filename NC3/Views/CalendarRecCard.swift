//
//  CalendarRecCard.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI

struct CalendarRecCard: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.clear)
                .frame(width: 353, height: 144)
                .background(
                    Image("TebetEcoPark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 353, height: 144)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                )
            
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.clear)
                .frame(width: 353, height: 144)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                            Gradient.Stop(color: .black.opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                )
            
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Text("Tebet Eco Park,")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("Jakarta")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
                Spacer()
                HStack(spacing: 0){
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("10:00 AM")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                        Text("Sunny | 29°")
                            .font(.footnote)
                            .foregroundColor(Color.white)
                    }
                    
                    
                }
                .padding(.top)
            }
            .padding()
            
        }
        .frame(width: 353, height: 144)
        .padding()
    }
}

#Preview {
    CalendarRecCard()
}
