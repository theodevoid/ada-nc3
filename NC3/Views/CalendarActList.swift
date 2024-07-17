//
//  CalendarActList.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 15/07/24.
//

import SwiftUI


struct CalendarActList: View {
    
    var recommendedLocation: [RecommendedLocation]
    var loadingStatus: CalendarViewModelStatus
    @State private var selectedTime: RecommendedLocationTime = .morning

    
    
    var body: some View {
        VStack{
            HStack{
                Text("Activities for You")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(UIColor.label))
                
                Spacer()
                VStack {
                    ToggleButton(selectedTime: $selectedTime)
                }
                .pickerStyle(.segmented)
                .frame(width: 160)
                
                
            }
            .padding()
            
            ScrollView{
                VStack{
                    if loadingStatus == .loading{
                        ActivityIndicator(isAnimating: .constant(true), style: .large)
                    }else{
                        ForEach(recommendedLocation){ recLocation in
                            if recLocation.time == selectedTime {
                                
                                NavigationLink(destination: DetailScreenView(recommendedLocation: recLocation)) {
                                    CalendarRecCard(recommendedLocation: recLocation)
                                }
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
        }
        .background(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 25, topTrailing: 25))
            .fill(Color(UIColor.systemBackground)))
    }
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
