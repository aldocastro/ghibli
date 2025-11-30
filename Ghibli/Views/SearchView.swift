//
//  SearchView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Buscar Películas", systemImage: "magnifyingglass")
        } description: {
            Text("Funcionalidad de búsqueda próximamente")
        }
    }
}
