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
    @State var selectedTime: String = "Morning"

    @ObservedObject var calendarViewModel = CalendarViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                
                Divider().opacity(0.0)
                
                CalendarPicker(calendarViewModel: calendarViewModel, selectedDate: $selectedDate, selectedDay: $selectedDay)

                
                
                SelectedDateDetail(selectedDay: $selectedDay, selectedDate: $selectedDate)
                
                
                CalendarActList(selectedTime: $selectedTime)

                
                
                

            }
            .background(Image("backgroundDarkLight").ignoresSafeArea())
            
        }
        .navigationTitle(Phrases.scheduleTitle)
    }
}




#Preview {
    NavigationView{
        CalenderView()
    }
}













