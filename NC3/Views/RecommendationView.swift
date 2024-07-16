//
//  RecommendationView.swift
//  NC3
//
//  Created by Leonardo Marhan on 11/07/24.
//

import SwiftUI

struct RecommendationView: View {
    var list: [RecommendedLocation]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(items: [RecommendedLocation], spacing: CGFloat = 20, trailingSpace: CGFloat = 55, index: Binding<Int>) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader{ proxy in
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list){ item in
                    itemView(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, 20)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    })
            )
        }
        .frame(height: 251)
    }
    
    @ViewBuilder
    func itemView(_ item: RecommendedLocation) -> some View {
        ZStack {
            Image(item.location.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 341, height: 251)
                .cornerRadius(12)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 341, height: 251)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                    Gradient.Stop(color: .black.opacity(0), location: 0.55),
                    Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
              .cornerRadius(10)
            
            VStack(alignment: .leading) {
                (
                    Text(item.location.locationName + ", ")
                    .font(.system(size: 28))
                    .bold() +
                    Text(item.location.city)
                    .font(.system(size: 26))
                ).foregroundColor(.subLabel)
                .padding(.bottom, 1)
                Text("Saturday, 20 July | 10:00 AM")
                  .font(Font.custom("SF Pro", size: 15))
                  .foregroundColor(.subLabel)
                Spacer()
                HStack {
                    Image(systemName: item.symbol)
                        .font(Font.custom("SF Pro", size: 34))
                        .foregroundColor(.subLabel)
                    Spacer()
                    Text(String(item.forecast.temperature))
                      .font(Font.custom("SF Pro", size: 17))
                      .multilineTextAlignment(.trailing)
                      .foregroundColor(.subLabel)
                }
            }
            .padding(20)
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
