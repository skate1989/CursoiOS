//
//  ListExample.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 09/08/26.
//

import SwiftUI

var pokemosn = [
    Pokemon(name:"Pikachu"),
    Pokemon(name:"Charmander"),
    Pokemon(name:"Goku"),
    Pokemon(name:"Goku"),
    Pokemon(name:"Gohan"),
    Pokemon(name:"Lista")
]

var digimons = [
    Digimon(name:"Agumon"),
    Digimon(name:"Enriquemon"),
    Digimon(name:"Sora3"),
    Digimon(name:"Sora4"),
    Digimon(name:"Sora4"),
    Digimon(name:"Sora5")
]

struct ListExample: View {
    var body: some View {
//        List{
//            Text("Prueba")
//            Text("Prueba")
//            Text("Prueba")
//            Text("Prueba")
//            Text("Prueba")
//        }
//        List{
//            ForEach(pokemosn, id:\.name){ Pokemon in
//                Text(Pokemon.name)
//            }
//        }
        
//        List(digimons){Digimon in
//            Text(Digimon.name)
//        }
        
//        List{
//            ForEach(digimons) { digimon in
//                /*@START_MENU_TOKEN@*/Text(digimon.name)/*@END_MENU_TOKEN@*/
//            }
//        }
        List{
            Section(header: Text("Pokemons"), content: {
                ForEach(pokemosn, id:\.name){ Pokemon in
                                Text(Pokemon.name)
                            }
            })
            Section(header: Text("Digimons"), content: {
                ForEach(digimons) { digimon in
                               /*@START_MENU_TOKEN@*/Text(digimon.name)/*@END_MENU_TOKEN@*/
                           }
            })
        }.listStyle(.automatic)
    }
}

struct Pokemon{
    let name: String
}

struct Digimon: Identifiable{
    var id = UUID()
    let name: String
}
#Preview {
    ListExample()
}
