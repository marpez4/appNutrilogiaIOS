//
//  DashboardView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import SwiftUI

struct DashboardView: View{
    @Binding var pesoActual: Double
    @Binding var pesosRegistrados: [Peso]
    @State private var pesoMeta: Double = 70.0
    @State private var ultimaReceta: String = "Ensalada de Quinoa"
    
    let imagenes: [String] = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5"
    ]
    
    @State private var selectedTab = 0
    
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text("Bienvenido Alfonso Martínez")
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .padding(.top)
                VStack{
                    TabView(selection: $selectedTab){
                        ForEach(imagenes.indices, id: \.self){index in
                            Image(imagenes[index])
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .tag(index)
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
                        Image("image9")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading){
                            Text("Peso actual: \(pesoActual, specifier: "%.1f") kg")
                            Text("Peso objetivo: \(pesoMeta, specifier: "%.1f") kg")
                        }
                        Spacer()
                        ProgressView(value: max(0, pesoActual - pesoMeta), total: pesoMeta)
                        
                            .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            .background(Color.black)
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
                        
                        ShortcutButton(title: "Peso", imagename: "image8")
                                           ShortcutButton(title: "Menús", imagename: "image7")
                                           ShortcutButton(title: "Recetas", imagename: "image6")
                                       }
                        
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Ultima receta consultada")
                        .font(.headline)
                    HStack{
                        Image("image10")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
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
        .onAppear{
            startAutoTabChange()
        }
    }
    // Funcion para cambiar las imagenes en TabView
    private func startAutoTabChange(){
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true){_ in
            selectedTab = (selectedTab + 1) % imagenes.count
        }
    }
    
}
	
// Botón de Atajo Reutilizable
struct ShortcutButton: View {
    var title: String
    var imagename: String

    var body: some View {
        VStack {
            Image(imagename)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
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
    DashboardView(pesoActual: .constant(0.0), pesosRegistrados: .constant([Peso(valor: 0.0, fecha: Date(), nota: "")]))
}
