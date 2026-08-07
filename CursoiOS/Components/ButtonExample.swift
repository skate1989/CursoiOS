//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 07/08/26.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("holiwi")
        }
        Button(action: {print("holiwi")}, label: {
            Text("Hola")
                .frame(width: 100, height: 50)
                .foregroundColor(Color.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct counter:View {
    @State var subscribNumber = 0
    var body: some View {
        Button(action: {
            subscribNumber += 1
        }, label: {
            Text("Suscriptores: \(subscribNumber)")
                .bold()
                .font(.title)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    counter()
}
