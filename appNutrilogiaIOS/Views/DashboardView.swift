//
//  DashboardView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import SwiftUI

struct DashboardView: View{
    @State private var pesoActual: Double = 90.0
    @State private var pesoMeta: Double = 70.0
    @State private var ultimaReceta: String = "Ensalada de Quinoa"
    
    let imagenes: [String] = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5"
    ]
    
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text("Bienvenido Alfonso Martínez")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .padding(.top)
                VStack{
                    TabView{
                        ForEach(imagenes, id: \.self){imagen in
                            Image(imagen)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 200)
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Progreso de peso")
                        .font(.headline)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Peso actual: \(pesoActual, specifier: "%.1f") kg")
                            Text("Peso objetivo: \(pesoMeta, specifier: "%.1f") kg")
                        }
                        Spacer()
                        ProgressView(value: max(0, pesoActual - pesoMeta), total: pesoMeta)
                        
                            .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            .frame(width: 150)
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Lleva el control de:")
                        .font(.headline)
                    HStack(spacing: 20) {
                        
                            ShortcutButton(title: "Peso", systemImage: "scalemass")
                                           ShortcutButton(title: "Menús", systemImage: "list.bullet")
                                           ShortcutButton(title: "Recetas", systemImage: "book.fill")
                                       }
                        
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Ultima receta consultada")
                        .font(.headline)
                    HStack{
                        Text(ultimaReceta)
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "arrow.forward.circle")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                Spacer()
            }
            
        }
    }
    
}

// Botón de Atajo Reutilizable
struct ShortcutButton: View {
    var title: String
    var systemImage: String

    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 42, height: 35)
                .foregroundColor(.blue)
            Text(title)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    DashboardView()
}
