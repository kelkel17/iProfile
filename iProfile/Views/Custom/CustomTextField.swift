//
//  CustomTextField.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI

struct CustomTextField: View {
    var image: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 0) {
                Image(systemName: image)
                    .font(.system(size: 24))
                    .foregroundColor(Color.black)
                    .frame(width: 60, height: 60)
                
                if placeholder.lowercased().contains("password") {
                    SecureField("", text: $text)
                        .customPlaceholder(placeholder)
                } else {
                    TextField("", text: $text)
                        .customPlaceholder(placeholder)
                }
                    
            }
            .padding(.trailing)
        }
        .frame(height: 60)
        .background(Color.white.opacity(0.2))
        .clipShape(Capsule())
        .padding(.horizontal)
    }
}

extension View {
    func customPlaceholder(_ placeholder: String) -> some View {
         return Text(placeholder)
                 .font(Font.system(size: 24))
                 .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white.opacity(0.8))
                .autocapitalization(.none)
     }
}
