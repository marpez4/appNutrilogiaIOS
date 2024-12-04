//
//  PesoViewModel.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 04/12/24.
//
import Foundation

class PesoViewModel: ObservableObject {
    
    @Published var pesosRegistrados: [Peso] = []

    func registrarPeso(valor: String, nota: String?, onError: (String) -> Void) {
        if let peso = Double(valor), peso > 0 {
            let nuevoPeso = Peso(valor: peso, fecha: Date(), nota: nota?.isEmpty == false ? nota : nil)
            pesosRegistrados.append(nuevoPeso)
        } else {
            onError("Por favor, introduce un peso válido.")
        }
    }
    
    func eliminarPeso(at offsets: IndexSet){
        pesosRegistrados.remove(atOffsets: offsets)
    }
}


