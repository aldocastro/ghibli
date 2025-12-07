//
//  SearchView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct SearchView: View {
    private let viewTitle = "Buscar"
    @Environment(FilmsViewModel.self) var filmsViewModel

    var body: some View {
        @Bindable var vm = filmsViewModel
        NavigationStack {
            if vm.filteredFilms.isEmpty {
                ContentUnavailableView {
                    Label("Búsqueda de películas", systemImage: "magnifyingglass")
                } description: {
                    Text("... por títulos, productores, directores, etc.")
                }.navigationTitle(viewTitle)
            } else {
                FilmList(films: vm.filteredFilms, viewTitle: viewTitle)
            }
        }
        .searchable(text: $vm.searchTerm, prompt: "Buscar...")
    }
}

#Preview {
    SearchView()
        .environment(FavoritesViewModel())
        .environment(FilmsViewModel())
}
