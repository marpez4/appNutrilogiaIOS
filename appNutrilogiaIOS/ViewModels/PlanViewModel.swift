//
//  PlanViewModel.swift
//  appNutrilogiaIOS
//
//  Created by Alfonso Martinez on 05/12/24.
//

import SwiftUI

class PlanViewModel: ObservableObject {
    // Lista de menús disponibles
    @Published var menus: [Menu] = []

    init() {
        loadMenus()
    }

    // Cargar los menús disponibles
    func loadMenus() {
        menus = [
            Menu(title: "Menú de Diciembre", content: """
            • Desayuno: Avena con manzana y nueces.
            • Almuerzo: Ensalada de quinoa con pollo y verduras asadas.
            • Cena: Sopa de lentejas y tostadas integrales.
            • Snack: Yogur natural con fresas.
            • Actividad: 30 minutos de ejercicio diario.
            """,
                 images: [
                    "Desayuno": "https://osterstatic.reciperm.com/webp/10156.webp",
                    "Almuerzo": "https://cdn7.kiwilimon.com/recetaimagen/1505/960x640/12060.jpg.jpg",
                    "Snack": "https://cdn0.recetasgratis.net/es/posts/4/7/3/yogur_de_fresa_casero_9374_orig.jpg",
                    "Cena": "https://pittsburghfoodbank.org/wp-content/uploads/2021/08/Recipe-Images-20.png"                    
                 ]),
            Menu(
                        title: "Menú de Noviembre",
                        content: """
                        • Desayuno: Smoothie verde (espinaca, plátano y leche de almendra).
                        • Almuerzo: Salmón al horno con arroz integral y brócoli.
                        • Cena: Ensalada de espinacas con huevo cocido.
                        • Snack: Zanahorias baby con hummus.
                        • Actividad: Consume frutas y verduras en cada comida.
                        """,
                        images: [
                            "Desayuno": "https://www.licuadoras.com/wp-content/uploads/2020/05/Smoothie-verde.jpg",
                            "Almuerzo": "https://cdn7.kiwilimon.com/recetaimagen/28685/19072.jpg",
                            "Cena": "https://www.clara.es/medio/2021/10/14/ensalada-espinacas-frescas_c7e70dcd_1280x720.jpg",
                            "Snack": "https://www.nutricioni.com/images/recetas/zanahorias-baby-con-hummus.jpg"
                        ]
                    ),
                    Menu(
                        title: "Menú de Octubre",
                        content: """
                        • Desayuno: Tortilla de espinacas con aguacate.
                        • Almuerzo: Pechuga de pollo a la parrilla con puré de camote.
                        • Cena: Crema de calabaza con pan integral.
                        • Snack: Nueces y almendras (un puñado).
                        • Actividad: Bebe al menos 2 litros de agua al día.
                        """,
                        images: [
                            "Desayuno": "https://www.annarecetasfaciles.com/files/tortilla-de-espinacas-1-scaled.jpg",
                            "Almuerzo": "https://recetasdecocina.elmundo.es/wp-content/uploads/2020/01/pechuga-de-pollo-parrilla.jpg",
                            "Cena": "https://www.goya.com/media/4441/crema-de-calabaza.jpg",
                            "Snack": "https://media.istockphoto.com/photos/almonds-and-walnuts-in-a-wooden-bowl-picture-id1212409927"
                        ]
                    ),
                    Menu(
                        title: "Menú de Septiembre",
                        content: """
                        • Desayuno: Pan integral con queso fresco y jitomate.
                        • Almuerzo: Filete de pescado con ensalada fresca.
                        • Cena: Caldo de pollo con verduras.
                        • Snack: Manzana con crema de cacahuate.
                        • Actividad: Duerme entre 7 y 8 horas cada noche.
                        """,
                        images: [
                            "Desayuno": "https://mejorconsalud.as.com/wp-content/uploads/2018/04/queso-fresco-1.jpg",
                            "Almuerzo": "https://www.comedera.com/wp-content/uploads/2022/04/filete-de-pescado-a-la-plancha.jpg",
                            "Cena": "https://comidastipicasde.com/wp-content/uploads/2021/08/caldo-de-pollo-con-verduras.jpg",
                            "Snack": "https://www.recetasparavivirmejor.com/wp-content/uploads/2021/06/manzana-y-mantequilla-de-cacahuate.jpg"
                        ]
                    )
        ]
    }
}
