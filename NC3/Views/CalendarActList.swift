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
                Text(Phrases.activitiesTitle)
                    .font(.headline)
                    .fontWeight(.heavy)
                
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
                        ForEach(recommendedLocation){recLocation in
                            if recLocation.time == selectedTime{
                                CalendarRecCard(recommendedLocation: recLocation)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
        }
        .background(RoundedRectangle(cornerRadius: 25.0)
            .fill(.accent))
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
