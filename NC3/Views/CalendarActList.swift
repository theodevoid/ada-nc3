//
//  CalendarActList.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 15/07/24.
//

import SwiftUI


struct CalendarActList: View {
    
    @Binding var selectedTime: String
    
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
                    ForEach(1..<5, id: \.self) { index in
                        CalendarRecCard()
                    }
                }
            }
            
            Spacer()
            
        }
        .background(RoundedRectangle(cornerRadius: 25.0)
            .fill(.accent))
    }
}

#Preview {
    CalendarActList(selectedTime: .constant("Morning"))
}
