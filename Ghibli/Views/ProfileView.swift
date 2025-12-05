//
//  ProfileView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct ProfileView: View {
    @State private var profileViewModel = ProfileViewModel()
    @Environment(FavoritesViewModel.self) private var favoritesViewModel
    @Environment(FilmsViewModel.self) private var filmsViewModel

    @State var name: String = ""
    @State var searchTerm: String = ""
    
    var body: some View {
        @Bindable var favoritesVM = favoritesViewModel
        @Bindable var filmsVM = filmsViewModel

        NavigationStack {
            Form {
                Section(header: Text("Información Personal")) {
                    TextField("Tu nombre", text: $name)
                    TextField("Busca película...", text: $searchTerm)
                }
                Section(header: Text("Estadísticas")) {
                    TitleValueRow(
                        title: "Películas Favoritas",
                        titleColor: .red,
                        image: "heart.fill",
                        value: $favoritesVM.favoriteCount
                    )

                    TitleValueRow(
                        title: "Películas Disponibles",
                        titleColor: .blue,
                        image: "film.fill",
                        value: $filmsVM.totalOfFilms)
                }
                
                Button("Guardar") {
                    print("Guardando cambios en perfil")
                    profileViewModel.save()
                }
            }
            .navigationTitle("Perfil")
        }
    }
}

fileprivate struct EmptyView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Aquí va tu perfil", systemImage: "person.circle")
        }
        .navigationTitle("Perfil")
    }
}

#Preview {
    ProfileView()
        .environment(FilmsViewModel())
        .environment(FavoritesViewModel())
}
