//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 09/08/26.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[SuperHero]
    }
    
    struct SuperHero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperhero
    }
    
    struct ImageSuperhero:Codable{
        let url:String
    }
    
    struct SuperheroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperhero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable{
        let fullName:String
        let aliases:[String]
        let publisher:String
        let alignment:String
        
        enum CodingKeys:String , CodingKey{
            case fullName = "full-name"
            case aliases = "aliases"
            case publisher = "publisher"
            case alignment = "alignment"
        }
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string:
                        "https://www.superheroapi.com/api.php/55de18db3b37dabfec827bd87e79b7af/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        let wraper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wraper
    }
    
    func superheroById(id:String) async throws -> SuperheroCompleted{
        let url = URL(string:
                        "https://superheroapi.com/api/55de18db3b37dabfec827bd87e79b7af/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperheroCompleted.self, from: data)

    }
}
