//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 07/08/26.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Suscribete",systemImage: "figure.badminton")
        Label(
            title: {Text("Laber")},
            icon: {Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)})
    }
}

#Preview {
    LabelExample()
}
