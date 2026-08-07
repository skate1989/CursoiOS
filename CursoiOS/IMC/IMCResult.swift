//
//  IMCResult.swift
//  CursoiOS
//
//  Created by Jose Enrique Martinez Hernandez on 08/08/26.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu Resultado").font(.title).bold().foregroundColor(.white)
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
    }
}

func calculateImc(weight:Double, height:Double) -> Double{
    let result = weight / ((height/100)*(height/100))
    return result
}

struct InformationView: View {
    let result:Double
    var body: some View{
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Spacer()
            Text("\(result,specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal,8)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(20).padding(16)
    }
}

func getImcResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result {
    case 0.00...19.99:
        title = "peso bajo"
        description = "estas por debajo del peso indicado"
        color = .yellow
    case 20.00...24.99:
        title = "peso normal"
        description = "tienes un peso normal"
        color = .green
    case 25.00...29.99:
        title = "sobre peso"
        description = "estas sobre peso"
        color = .orange
    case 30.00...100:
        title = "obesidad"
        description = "estas demasiado gordo"
        color = .red
    default:
        title = "Error"
        description = "Ha ocurrido un error"
        color = Color.red
    }
    
    return (title,description,color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 180)
}
