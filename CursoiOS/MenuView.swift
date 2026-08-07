//
//  MenuView.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 08/08/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List{Section(header: Text("Menu Apps"), content: {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperheroSearcher()){
                    Text("Superhero finder")
                }
                Text("App 2")
                Text("App 3")
                Text("App 4")
            })
            }
        }
    }
}

#Preview {
    MenuView()
}
