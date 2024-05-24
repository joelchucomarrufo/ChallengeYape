//
//  ShimmerModifier.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI
import Combine

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0.1), Color.white.opacity(0.4)]), startPoint: .trailing, endPoint: .leading)
                    .rotationEffect(.degrees(45))
                    .offset(x: phase * 170 - 108)
            )
            .mask(content)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    phase = 3
                }
            }
    }
}
