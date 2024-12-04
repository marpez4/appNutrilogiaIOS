//
//  DashboardView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import SwiftUI

struct DashboardView: View{
    var body: some View{
        VStack{
            Text("Bienvenido a tu espacio saludable")
                .font(.headline)
                .padding()
            Text("Progreso de peso")
                .font(.subheadline)
        }
        .padding()
    }
    
}

#Preview {
    DashboardView()
}
