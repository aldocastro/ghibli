//
//  MainTabView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Películas", systemImage: "film.stack") {
                FilmsListView(films: [])
            }
            Tab("Favoritas", systemImage: "heart.fill") {
                ContentUnavailableView {
                    Label("Sin Favoritas", systemImage: "heart.slash")
                } description: {
                    Text("Aún no has guardado ninguna película favorita")
                }
            }
            Tab("Buscar", systemImage: "magnifyingglass") {
                ContentUnavailableView {
                    Label("Buscar Películas", systemImage: "magnifyingglass")
                } description: {
                    Text("Funcionalidad de búsqueda próximamente")
                }
            }
            Tab("Perfil", systemImage: "person.fill") {
                ContentUnavailableView {
                    Label("Aquí va tu perfil", systemImage: "person.circle")
                }
            }
        }
    }
}
