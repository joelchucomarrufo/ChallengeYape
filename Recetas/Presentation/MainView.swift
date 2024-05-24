//
//  MainView.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI

struct MainView: View {
    @State private var showSplashScreen = true
       
    var body: some View {
        Group {
            if showSplashScreen {
                SplashScreen()
            } else {
                HomeScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showSplashScreen = false
                }
            }
        }
    }
}
