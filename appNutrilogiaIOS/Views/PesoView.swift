//
//  PesoView.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import SwiftUI

struct PesoView: View {
    
    @Binding var pesoActual: Double
    @Binding var pesosRegistrados: [Peso]
    
    @StateObject private var viewModel = PesoViewModel()
    @State private var isSheetPresented: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var nuevoPeso: String = ""
    @State private var nota: String = ""

    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 10){
                Text("Registro de pesos")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                List{
                    ForEach(viewModel.pesosRegistrados) { peso in
                        HStack{
                            Text("\(peso.valor, specifier: "%.1f") kg")
                                .font(.subheadline)
                            Spacer()
                            Text("\(peso.fecha, formatter: pesoFormatter)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(peso.nota ?? "")
                                .font(.subheadline)
                        }
                    }
                    .onDelete(perform: eliminarPeso)
                }
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Registro de pesos")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Label("Registrar peso", systemImage: "plus")
                        .font(.headline)
                }
            }
        }
        .sheet(isPresented: $isSheetPresented){
            NavigationView{
                VStack {
                    Text("Registrar nuevo peso")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    TextField("Introduce tu peso actual", text: $nuevoPeso)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(10)
                    
                    TextField("Introduce una nota opcional", text: $nota)
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                    .padding(.top, 10)
                }
                .padding()
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancelar"){
                            isSheetPresented = false
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Guardar"){
                            guardarPeso()
                        }
                    }                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
                }
            }
        }
    }
    
    private func guardarPeso(){
        viewModel.registrarPeso(valor: nuevoPeso, nota: nota){error in
            alertMessage = error
            showAlert = true
        }
        if !showAlert{
            // Actualizamos el peso actual en el dashboard despues de guardar
            if let ultimoPeso = viewModel.pesosRegistrados.last{
                pesoActual = ultimoPeso.valor
            }
            nuevoPeso = ""
            nota = ""
            isSheetPresented = false
        }
    }
    
    private func eliminarPeso(at offsets: IndexSet){
        viewModel.eliminarPeso(at: offsets)
        
    }
}


// Formateador de fecha
let pesoFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()

#Preview {
    PesoView(pesoActual: .constant(0.0), pesosRegistrados: .constant([Peso(valor: 0.0, fecha: Date(), nota: "")]))
}
