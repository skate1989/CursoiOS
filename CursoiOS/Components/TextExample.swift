//
//  TextExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 06/08/26.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom")
                .font(.system(size: 40, weight: .light, design:
                        .monospaced))
                .italic()
                .bold()
                .underline()
                .foregroundColor(Color.yellow)
            Text("jose jose jose jose jose")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(12)
        }
    }
}

#Preview {
    TextExample()
}
