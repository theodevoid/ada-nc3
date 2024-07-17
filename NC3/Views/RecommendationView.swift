//
//  RecommendationView.swift
//  NC3
//
//  Created by Leonardo Marhan on 11/07/24.
//

import SwiftUI

struct RecommendationView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var randomItems: [RecommendedLocation] = []
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
                ForEach(list.prefix(4)){ item in
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
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), 3), 0)
                    })
            )
        }
        .frame(height: 362)
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    func itemView(_ item: RecommendedLocation) -> some View {
        NavigationLink(destination: DetailScreenView(recommendedLocation: item)) {
            
            ZStack {
                Rectangle()
                    .frame(height: 362)
                    .foregroundColor(Color(UIColor.tertiarySystemBackground))
                    .cornerRadius(10)
                
                VStack {
                    ZStack {
                        Image(item.location.locationName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0.8), location: 0.00),
                                Gradient.Stop(color: .black.opacity(0), location: 0.55),
                                Gradient.Stop(color: .black.opacity(0.8), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    }
                    
                    .frame(width: 341, height: 251)
                    .cornerRadius(10)
                    Spacer()
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.location.locationName + ", ")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(Color(UIColor.label))
                            Text(item.location.city)
                                .font(.system(size: 20))
                                .padding(.bottom, 1)
                                .foregroundColor(Color(UIColor.label))
                            if item.time == .morning {
                                Text(viewModel.formatDayDate(date: item.date) + " | 08:00 AM")
                                    .font(Font.custom("SF Pro", size: 17))
                                    .foregroundColor(Color(UIColor.label))
                            } else {
                                Text(viewModel.formatDayDate(date: item.date) + " | 04:00 PM")
                                    .font(Font.custom("SF Pro", size: 17))
                                    .foregroundColor(Color(UIColor.label))
                            }
                        }
                        Spacer()
                        Image(systemName: "\(item.symbol).fill")
                            .font(Font.custom("SF Pro", size: 34))
                            .foregroundColor(Color(UIColor.label))
                    }
                    .padding(.horizontal, 10)
                    Spacer()
                }
            }
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
