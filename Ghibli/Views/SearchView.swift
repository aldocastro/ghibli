//
//  SearchView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct SearchView: View {
    private let viewTitle = "Buscar"
    var body: some View {
        NavigationStack {
            ContentUnavailableView {
                Label("Buscar Películas", systemImage: "magnifyingglass")
            } description: {
                Text("Funcionalidad de búsqueda próximamente")
            }
            .navigationTitle(viewTitle)
        }
    }
}
