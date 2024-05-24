//
//  YapeCard.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import Foundation
import SwiftUI

struct FintechCard: View {
    let recipe: RecipeModel
    
    var body: some View {
        Button(action: {
            ScreenNavigation().redirectToScreen(to: RecipeScreen(recipeModel: recipe), direction: .fromRight)
        }) {
            VStack(alignment: .leading) {
                HStack {
                    YapeImageView(url: recipe.image, width: 170, height: 108)
                        .padding(8)
                    
                    Text(recipe.title)
                        .font(.custom("PoetsenOne-Regular", size: 16))
                        .foregroundStyle(Color("IconText"))
                        .padding(.vertical, 8)
                    
                    Spacer()
                }
                
            }
            .background(Color("TextFieldBackground"))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("BorderText"), lineWidth: 1)
            )
            .padding([.leading, .trailing], 12)
        }
    }
}
