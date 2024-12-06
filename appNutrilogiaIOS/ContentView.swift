//
//  ContentView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pesoActual: Double = 0.0
    @State private var pesosRegistrados: [Peso] = []
    
    var body: some View {
        NavigationView {
            TabView {
                DashboardView(pesoActual: $pesoActual, pesosRegistrados: $pesosRegistrados)
                    .tabItem {
                        Label("Inicio", systemImage: "house.fill")
                    }
                PesoView(pesoActual: $pesoActual, pesosRegistrados: $pesosRegistrados)
                    .tabItem {
                        Label("Pesos", systemImage: "scalemass")
                    }
                MenuView()
                    .tabItem {
                        Label("Menús", systemImage: "list.bullet")
                    }
            }
            .navigationTitle("GoodHealth")
        }
    }
}

#Preview {
    ContentView()
}
