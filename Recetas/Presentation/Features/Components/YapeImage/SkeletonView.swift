//
//  SkeletonView.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI
import Combine

struct SkeletonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(.systemGray5))
            .shimmering()
    }
}

extension View {
    func shimmering() -> some View {
        self.modifier(ShimmerModifier())
    }
}
