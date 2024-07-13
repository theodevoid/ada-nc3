//
//  WeekendView.swift
//  NC3
//
//  Created by Leonardo Marhan on 11/07/24.
//

import SwiftUI

struct WeekendView: View {
    var list: [Location]
    var spacing: CGFloat
    @Binding var index: Int
    
    init(items: [Location], spacing: CGFloat = 10,index: Binding<Int>) {
        self.list = items
        self.spacing = spacing
        self._index = index
    }
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width / 2.1 - spacing
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    ForEach(list) { item in
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
    func itemView(_ item: Location) -> some View {
        ZStack {
            Image(item.image)
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
                Text(item.locationName + ", ")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97)) +
                Text(item.city)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                Spacer()
                HStack {
                    Text("􀇕")
                        .font(Font.custom("SF Pro", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("25°")
                      .font(
                        Font.custom("SF Pro", size: 17)
                          .weight(.semibold)
                      )
                      .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
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

