//
//  FilmsListView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmsListView: View {
    private let viewTitle = "Peliculas"
    @Environment(FilmsViewModel.self) private var viewModel
    @Environment(FavoritesViewModel.self) private var favViewModel
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .empty:
                EmptyList()
                    .navigationTitle(viewTitle)
            case .loading:
                ProgressView {
                    Text("Cargando peliculas...")
                }
                .navigationTitle(viewTitle)
            case .loaded(let films):
                FilmList(films: films, viewTitle: viewTitle)
            case .error(let error):
                ErrorView(error: error)
                    .navigationTitle(viewTitle)
            }
        }
    }
}

fileprivate struct EmptyList: View {
    var body: some View {
        ContentUnavailableView {
            Label("No hay peliculas", systemImage: "film")
        } description: {
            Text("No se encontraron películas de Studio Ghibli")
        }
    }
}

fileprivate struct ErrorView: View {
    let error: Error
    
    var body: some View {
        ContentUnavailableView {
            Label("No se pudieron cargar las películas.", systemImage: "exclamationmark.triangle")
        } description: {
            Text(error.localizedDescription)
        }
    }
}

#Preview {
    let vm = FilmsViewModel()
    FilmsListView()
        .environment(vm)
        .environment(FavoritesViewModel())
        .task {
            await vm.loadFilms()
        }
}
