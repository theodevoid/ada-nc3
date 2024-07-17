//
//  CalenderView.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 11/07/24.
//

import SwiftUI

struct CalenderView: View {
    
    @State private var selectedDate: String = ""
    @State private var selectedDay: String = ""
    
    @ObservedObject var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Schedule")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.horizontal, 20)
                    Spacer()
                }
                Divider().opacity(0.0)
                
                CalendarPicker(calendarViewModel: calendarViewModel, selectedDate: $selectedDate, selectedDay: $selectedDay)
                
                SelectedDateDetail(selectedDay: $selectedDay, selectedDate: $selectedDate)
                
                CalendarActList(recommendedLocation: calendarViewModel.recommendedLocation, loadingStatus: calendarViewModel.status)
            }
            .background(Image("backgroundDarkLight").ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
}




#Preview {
    NavigationView{
        CalenderView()
    }
}













