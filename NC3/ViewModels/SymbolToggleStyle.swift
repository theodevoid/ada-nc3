//
//  SymbolToggleStyle.swift
//  NC3
//
//  Created by Lazuardhi Imani Ahfar on 12/07/24.
//

import SwiftUI

struct SymbolToggleStyle: ToggleStyle {

    var systemImage: String = "checkmark"
    var activeColor: Color = .green

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? LinearGradient(colors: [.orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay {
                    RoundedRectangle(cornerRadius: 30)            .fill(.white)
                        .padding(3)
                        .overlay {
                            Text(configuration.isOn ? "Noon" : "Morning")
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(configuration.isOn ? activeColor : Color(.blue))
                        }
                        .offset(x: configuration.isOn ? 30 : -30)
                        .frame(width: 80, height: 32)

                }
                .frame(width: 160, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
