//
//  ContentView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                DashboardView()
                    .tabItem {
                        Label("Inicio", systemImage: "house.fill")
                    }
                PesoView()
                    .tabItem {
                        Label("Pesos", systemImage: "scalemass")
                    }
                MenuView()
                    .tabItem {
                        Label("Menús", systemImage: "list.bullet")
                    }
                RecetaView()
                    .tabItem {
                        Label("Recetas", systemImage: "book.fill")
                    }
            }
            .navigationTitle("Nutriología")
        }
    }
}

#Preview {
    ContentView()
}
