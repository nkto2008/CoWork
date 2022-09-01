//
//  buttonLandingStyle.swift
//  CoWorkApp
//
//  Created by Alexandre Marcos on 27/08/2022.
//

import SwiftUI

struct LandingButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.white)
    }
}
