//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 09/08/26.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    
    @State var superhero:ApiNetwork.SuperheroCompleted? = nil
    @State var loading:Bool = true
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superhero = superhero{
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self){ alias in
                    Text(alias).foregroundColor(.gray).italic()
                }
                SuperheroStats(stats: superhero.powerstats)
                Spacer()
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundApp)
            .onAppear {
                Task{
                    do{
                        superhero = try await ApiNetwork().superheroById(id: id)
                    }catch{
                        superhero = nil
                    }
                    loading = false
                }
            }
    }
}

struct SuperheroStats:View {
    let stats:ApiNetwork.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle: .value("count",Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "combat"))
                SectorMark(angle: .value("count",Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "durability"))
                SectorMark(angle: .value("count",Int(stats.intelligence) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "intelligence"))
                SectorMark(angle: .value("count",Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "power"))
                SectorMark(angle: .value("count",Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "speed"))
                SectorMark(angle: .value("count",Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.7),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("category", "strength"))
            }
        }.padding(16).frame(maxWidth: .infinity,maxHeight: 350).background(.white)
            .cornerRadius(16)
            .padding(24)
    }
}
#Preview {
    SuperheroDetail(id: "4")
}
