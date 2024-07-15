//
//  RecommendationView.swift
//  NC3
//
//  Created by Leonardo Marhan on 11/07/24.
//

import SwiftUI

struct RecommendationView: View {
    var list: [Location]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(items: [Location], spacing: CGFloat = 20, trailingSpace: CGFloat = 55, index: Binding<Int>) {
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
        HStack(alignment: .center, spacing: 8) {
            Spacer()
            ForEach(0...3, id: \.self) {x in
                if currentIndex != x {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.white)
                        .opacity(0.3)
                } else {
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .cornerRadius(50)
    }
    
    @ViewBuilder
    func itemView(_ item: Location) -> some View {
        ZStack {
            Image(item.image)
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
                Text(item.locationName + ", ")
                    .font(.system(size: 28))
                    .bold() +
                Text(item.city)
                    .font(.system(size: 26))
                ).foregroundColor(.subLabel)
                .padding(.bottom, 1)
                Text("Saturday, 20 July | 10:00 AM")
                  .font(Font.custom("SF Pro", size: 15))
                  .foregroundColor(.subLabel)
                Spacer()
                HStack {
                    Text("􀇕")
                        .font(Font.custom("SF Pro", size: 34))
                        .foregroundColor(.subLabel)
                    Spacer()
                    Text("Partly Cloudy | 29°")
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
