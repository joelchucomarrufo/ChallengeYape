//
//  HomeScreen.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var homeViewModel = HomeViewModel.shared
    
    var body: some View {
        
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 36)
                                .foregroundColor(Color("BackgroundHeader"))
                                .frame(height: 320)
                
            }
            .position(x: UIScreen.main.bounds.width/2, y: -36)
            
            VStack {
                Text("Recetas")
                    .font(.custom("LobsterTwo-Bold", size: 32))
                    .foregroundStyle(Color("Text"))
                    .padding(.top, 12)
                
                YapeTextField(hint: "Buscar receta",
                              text: $homeViewModel.searchText, onEditingChanged: {
                    homeViewModel.filterRecipes()
                })
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(homeViewModel.recipeListFiltered) { recipe in
                            FintechCard(recipe: recipe)
                        }
                    }
                }
                .padding(.top, 20)
                
            }
            .onAppear {
                homeViewModel.requestRecipes()
            }
            
            if homeViewModel.isLoading {
                LoadingScreen()
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
        .onAppear {
            self.homeViewModel.filterRecipes()
        }
    }
}
