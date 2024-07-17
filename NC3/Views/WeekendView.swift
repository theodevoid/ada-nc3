//
//  WeekendView.swift
//  NC3
//
//  Created by Leonardo Marhan on 11/07/24.
//

import SwiftUI

struct WeekendView: View {
    var list: [RecommendedLocation]
    var spacing: CGFloat
    @Binding var index: Int
    
    init(items: [RecommendedLocation], spacing: CGFloat = 10,index: Binding<Int>) {
        self.list = items
        self.spacing = spacing
        self._index = index
    }
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.1 - spacing
            
            VStack(spacing: spacing) {
                HStack(spacing: spacing) {
                    ForEach(list.prefix(2), id: \.id) { item in
                        itemView(item)
                            .frame(width: width)
                    }
                }
                
                HStack(spacing: spacing) {
                    ForEach(list.suffix(2), id: \.id) { item in
                        itemView(item)
                            .frame(width: width)
                    }
                }
            }
            .padding(.horizontal, 15)
        }
        .frame(height: 2 * (214 + spacing))
    }
    
    @ViewBuilder
    func itemView(_ item: RecommendedLocation) -> some View {
        NavigationLink(destination: DetailScreenView(recommendedLocation: item)) {
            ZStack {
                Rectangle()
                    .frame(height: 214)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                VStack {
                    ZStack {
                        Image(item.location.locationName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                                Gradient.Stop(color: .black.opacity(0), location: 0.65),
                                Gradient.Stop(color: .black.opacity(0), location: 0.92),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    }
                    .frame(width: 178, height: 119)
                    .cornerRadius(10)
                    Spacer()
                    VStack (alignment: .leading) {
                        (
                            Text(item.location.locationName + ", ")
                                .fontWeight(.semibold) +
                            Text(item.location.city)
                        )
                        .font(.system(size: 15))
                        Spacer()
                        HStack {
                            Image(systemName: "\(item.symbol).fill")
                                .font(Font.custom("SF Pro", size: 20))
                            Spacer()
                            Text(String(item.forecast.temperature) + "°")
                                .font(
                                    Font.custom("SF Pro", size: 17)
                                        .weight(.semibold)
                                )
                        }
                    }
                    .padding(10)
                }
            }
        }
    }
}

struct WeekendView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

