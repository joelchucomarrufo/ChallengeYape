//
//  MapScreen.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    let latitude: Double
    let longitude: Double
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            YapeMap(latitude: latitude, longitude: longitude)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cerrar")
                        .foregroundColor(Color("Text"))
                        .font(.custom("PoetsenOne-Regular", size: 18))
                })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("")
                            .font(.headline)
                            .foregroundColor(Color("Text"))
                    }
                }
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color("BackgroundHeader"))
            appearance.titleTextAttributes = [.foregroundColor: Color("Text")]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        .id(UUID())
    }
}
