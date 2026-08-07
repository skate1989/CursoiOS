//
//  SuperheroSearcher.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 09/08/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("",text: $superheroName,prompt:
                        Text("Superman...").font(.title2).bold().foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple,width: 2)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                loading = true
                Task{
                    do{
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                    }catch{
                        print("error")
                    }
                    loading = false
                }
            }
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination:
                                        SuperheroDetail(id: superhero.id)){EmptyView()}
                            .opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                    
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem:View {
    let superhero:ApiNetwork.SuperHero
    var body: some View {
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 100)
            
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title).bold()
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(28)
    }
}

#Preview {
    SuperheroSearcher()
}
