//
//  RecipeScreen.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI

struct RecipeScreen: View {
    
    @ObservedObject var homeViewModel = HomeViewModel.shared
    @State private var showMap = false
    var recipeModel: RecipeModel
    var numberLine = 0
    
    var body: some View {
        
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 36)
                    .foregroundColor(Color("BackgroundHeader"))
                    .frame(height: 300)
                
            }
            .position(x: UIScreen.main.bounds.width/2, y: -36)
            
            VStack {
                HStack(alignment: .top) {
                    Button(action: {
                        withAnimation {
                            ScreenNavigation().redirectToScreen(to: HomeScreen(), direction: .fromLeft)
                        }
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color("Text"))
                            .bold()
                    }
                    .frame(width: 24, height: 24)
                    .padding(.leading, 24)
                    .padding(.top, 20)
                    
                    Text(recipeModel.title)
                        .font(.custom("LobsterTwo-Bold", size: 32))
                        .foregroundStyle(Color("Text"))
                        .padding(.top, 12)
                        .padding(.horizontal, 24)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 96, alignment: .top)
                }
                .frame(maxWidth: .infinity, alignment: .top)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        YapeImageView(
                            url: recipeModel.image,
                            width: 357,
                            height: 227)
                        .padding(.horizontal, 24)
                        
                        Text("Ingredientes")
                            .font(.custom("PoetsenOne-Regular", size: 20))
                            .foregroundStyle(Color("IconText"))
                            .padding(.top, 24)
                            .padding(.horizontal, 32)
                        
                        ForEach(recipeModel.ingredientes, id: \.self) { ingrediente in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("IconText"))
                                    .frame(width: 8, height: 8)
                                
                                Text(ingrediente)
                                    .font(.custom("Comfortaa-SemiBold", size: 16))
                                    .foregroundStyle(Color("IconText"))
                                    .lineLimit(2)
                                    .padding(.leading, 8)
                                
                                Spacer()
                            }
                            .padding(.top, 8)
                            .padding(.trailing, 32)
                            .padding(.leading, 48)
                        }
                        
                        Text("Preparacion")
                            .font(.custom("PoetsenOne-Regular", size: 20))
                            .foregroundStyle(Color("IconText"))
                            .padding(.top, 24)
                            .padding(.horizontal, 32)
                        
                        ForEach(recipeModel.preparacion, id: \.self) { instruccion in
                            Text(instruccion)
                                .font(.custom("Comfortaa-SemiBold", size: 16))
                                .foregroundStyle(Color("IconText"))
                                .lineLimit(5)
                                .padding(.top, 8)
                                .padding(.trailing, 32)
                                .padding(.leading, 48)
                        }
                        
                        Button(action: {
                            showMap = true
                        }) {
                            HStack {
                                Image(systemName: "map.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("Text"))
                                    .frame(width: 24)
                                
                                Text("Ver mapa")
                                    .font(.custom("PoetsenOne-Regular", size: 18))
                                    .padding()
                                    .foregroundColor(Color("Text"))
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
                        .background(Color("BackgroundHeader"))
                        .cornerRadius(10)
                        .padding(.vertical, 24)
                        .padding(.horizontal, 32)
                    }
                }
                .padding(.top, 24)
            }
            
        }
        .sheet(isPresented: $showMap) {
            MapScreen(
                latitude: Double(recipeModel.latitude) ?? 0.0,
                longitude: Double(recipeModel.longitude) ?? 0.0)
        }
    }
}
