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
}
