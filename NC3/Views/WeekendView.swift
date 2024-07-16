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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(list, id: \.id) { item in
                        itemView(item)
                            .frame(width: width)
                    }
                }
                .padding(.horizontal, spacing)
            }
        }
        .frame(height: 119)
    }
    
    @ViewBuilder
    func itemView(_ item: RecommendedLocation) -> some View {
        ZStack {
            Image(item.location.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 178, height: 119)
                .cornerRadius(12)
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                    Gradient.Stop(color: .black.opacity(0), location: 0.65),
                    Gradient.Stop(color: .black.opacity(0), location: 0.92),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .frame(width: 178, height: 119)
            .cornerRadius(12)
            
            VStack(alignment: .leading) {
                (
                    Text(item.location.locationName + ", ")
                    .fontWeight(.semibold) +
                    Text(item.location.city)
                )
                .font(.system(size: 15))
                .foregroundColor(.subLabel)
                Spacer()
                HStack {
                    Text("􀇕")
                        .font(Font.custom("SF Pro", size: 20))
                        .foregroundColor(.subLabel)
                    Spacer()
                    Text(String(item.forecast.temperature) + "°")
                      .font(
                        Font.custom("SF Pro", size: 17)
                          .weight(.semibold)
                      )
                      .foregroundColor(.subLabel)
                }
            }
            .frame(width: 158)
            .padding(10)
        }
    }
}

struct WeekendView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

