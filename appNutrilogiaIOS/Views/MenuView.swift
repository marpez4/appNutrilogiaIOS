//
//  MenuView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import SwiftUI

struct MenuView: View{
    @StateObject var viewModel = PlanViewModel()
    
    @State private var expandedMenus: [String: Bool] = [:]
    
    var body: some View {
           NavigationView {
               VStack(alignment: .center, spacing: 10) {
                   Image("bannerApp2")
                       .resizable()
                       .scaledToFill()
                       .frame(height: 140)
                       .clipped()
                       .overlay(
                           Text("Control de menús")
                               .font(.title)
                               .fontWeight(.bold)
                               .foregroundColor(.orange)
                               .shadow(radius: 10),
                           alignment: .center
                           
                       )
                       .frame(maxWidth: .infinity)

                   List(viewModel.menus, id: \.title) { menu in
                       DisclosureGroup(isExpanded: Binding(
                           get: { expandedMenus[menu.title] ?? false },
                           set: { expandedMenus[menu.title] = $0 }
                       )) {
                           VStack(alignment: .leading, spacing: 10) {
                               ForEach(menu.content.split(separator: "\n"), id: \.self) { line in
                                   if line.contains("Desayuno") {
                                       // Mostrar imagen de desayuno centrada y con tamaño fijo
                                       AsyncImage(url: URL(string: menu.images["Desayuno"] ?? "")) { phase in
                                           switch phase {
                                           case .empty:
                                               ProgressView() // Indicador de carga mientras la imagen se descarga
                                                   .progressViewStyle(CircularProgressViewStyle())
                                           case .success(let image):
                                               image
                                                   .resizable()
                                                   .scaledToFit()
                                                   .frame(width: 200, height: 200) // Tamaño consistente
                                                   .padding(.top, 5)
                                                   .frame(maxWidth: .infinity) 
                                           case .failure:
                                               Image(systemName: "exclamationmark.triangle.fill")
                                                   .foregroundColor(.red)
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                           @unknown default:
                                               EmptyView()
                                           }
                                       }
                                       
                                       // Texto del desayuno
                                       Text(line)
                                           .font(.subheadline)
                                           .foregroundColor(.black)
                                           .padding(.top, 5)
                                   } else if line.contains("Almuerzo") {
                                       AsyncImage(url: URL(string: menu.images["Almuerzo"] ?? "")) { phase in
                                           switch phase {
                                           case .empty:
                                               ProgressView()
                                           case .success(let image):
                                               image
                                                   .resizable()
                                                   .scaledToFit()
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                                   .frame(maxWidth: .infinity)
                                           case .failure:
                                               Image(systemName: "exclamationmark.triangle.fill")
                                                   .foregroundColor(.red)
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                           @unknown default:
                                               EmptyView()
                                           }
                                       }
                                       
                                       // Texto del almuerzo
                                       Text(line)
                                           .font(.subheadline)
                                           .foregroundColor(.black)
                                           .padding(.top, 5)
                                   } else if line.contains("Cena") {
                                       AsyncImage(url: URL(string: menu.images["Cena"] ?? "")) { phase in
                                           switch phase {
                                           case .empty:
                                               ProgressView()
                                           case .success(let image):
                                               image
                                                   .resizable()
                                                   .scaledToFit()
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                                   .frame(maxWidth: .infinity)
                                           case .failure:
                                               Image(systemName: "exclamationmark.triangle.fill")
                                                   .foregroundColor(.red)
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                           @unknown default:
                                               EmptyView()
                                           }
                                       }
                                       
                                       // Texto de la cena
                                       Text(line)
                                           .font(.subheadline)
                                           .foregroundColor(.black)
                                           .padding(.top, 5)
                                   }else if line.contains("Snack") {
                                       AsyncImage(url: URL(string: menu.images["Snack"] ?? "")) { phase in
                                           switch phase {
                                           case .empty:
                                               ProgressView()
                                           case .success(let image):
                                               image
                                                   .resizable()
                                                   .scaledToFit()
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                                   .frame(maxWidth: .infinity) // Centrado
                                           case .failure:
                                               Image(systemName: "exclamationmark.triangle.fill")
                                                   .foregroundColor(.red)
                                                   .frame(width: 200, height: 200)
                                                   .padding(.top, 5)
                                           @unknown default:
                                               EmptyView()
                                           }
                                       }
                                       
                                       // Texto de la snack
                                       Text(line)
                                           .font(.subheadline)
                                           .foregroundColor(.black)
                                           .padding(.top, 5)
                                   }else if line.contains("Actividad") {
                                                                              
                                       // Texto de la Activida
                                       Text(line)
                                           .font(.subheadline)
                                           .fontWeight(.bold)
                                           .foregroundColor(.black)
                                           .padding(.top, 5)
                                   }
                               }
                           }
                       } label: {
                           Text(menu.title)
                               .font(.headline)
                               .padding(.vertical, 5)
                               .foregroundColor(.blue)
                       }
                       .padding(.bottom, 10)
                       .background()
                   }
                   .listStyle(PlainListStyle())
               }
               .padding()
           }
       }
   }

#Preview {
    MenuView()
}
