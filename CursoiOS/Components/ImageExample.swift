//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 06/08/26.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 90)
        
        Image(systemName: "figure.walk")
            .resizable()
    }
}

#Preview {
    ImageExample()
}
