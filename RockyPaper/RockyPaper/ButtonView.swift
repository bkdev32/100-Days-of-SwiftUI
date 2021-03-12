//
//  ButtonView.swift
//  RockyPaper
//
//  Created by Burhan Kaynak on 01/03/2021.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(width: 100, height: 70)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
            .cornerRadius(21)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color.blue, lineWidth: 1.0)
            )
            .shadow(color: .black, radius: 2)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonStyle())
    }
}

