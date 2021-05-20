//
//  Background+Extension.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI

extension View {
    func customBackground() -> some View {
        self
            .background(
                Image(uiImage: #imageLiteral(resourceName: "loginBackgroundJ"))
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
    }
    
    func roundImage() -> some View {
        self
            .frame(width: 150, height: 150, alignment: .center)
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .clipShape(Circle())
    }
}
