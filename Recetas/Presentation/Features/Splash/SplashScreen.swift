//
//  SplashScreen.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            ZStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240,height: 240)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashScreen()
}
