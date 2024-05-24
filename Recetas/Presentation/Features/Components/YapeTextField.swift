//
//  YapeTextField.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import Foundation
import SwiftUI
import OpenCombine

struct YapeTextField: View {
    
    var hint: String
    var limit: Int = 50
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var onEditingChanged: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("BorderText"), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("TextFieldBackground")).padding(2))
                    .shadow(color: shadowColor.opacity(1), radius: 1, x: 0, y: 0)
                
                HStack {
                    TextField(hint, text: $text, onEditingChanged: { _ in
                        onEditingChanged()
                    })
                        .keyboardType(.webSearch)
                        .font(.custom("Comfortaa-SemiBold", size: 14))
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 12)
                        .background(Color.clear)
                        .focused($isFocused)                    
                        .disableAutocorrection(true)
                        .limitInputLength(value: $text, length: limit)
                    
                    if (text.isEmpty) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("IconText"))
                            .padding(.trailing, 8)
                    } else {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color("IconText"))
                                .padding(.trailing, 8)
                        }
                    }
                    
                }
            }
            .frame(height: 40)            
        }
        .padding([.leading, .trailing], 24)
    }
    
    private var shadowColor: Color {
        if (isFocused) {
            return Color("ShadowTextFocus")
        } else {
            return .clear
        }
    }
}



#Preview {
    VStack{
        
        YapeTextField(hint: "Ingresa tus nombres",
                      text: .constant(""), onEditingChanged: {})
    }
}

struct TextFieldLimitModifier: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        content
            .onChange(of: value) { newValue in
                if newValue.count > length {
                    value = String(newValue.prefix(length))
                }
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifier(value: value, length: length))
    }
}
