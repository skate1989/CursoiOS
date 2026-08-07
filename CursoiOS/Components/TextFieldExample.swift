//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 08/08/26.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("Escribe tu email",text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("el antiguo valor era \(oldValue) y el nuevo es \(newValue)")
                }
        SecureField("Escribe tu contraseña",text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("el antiguo valor era \(oldValue) y el nuevo es \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
