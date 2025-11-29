//
//  FilmsListView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmsListView: View {
    let films: [Film]

    var body: some View {
        List(films) { film in
            NavigationLink(value: film) {
                FilmRow(film: film)
            }
            .buttonStyle(.plain)
        }
        .navigationDestination(for: Film.self) { film in
            FilmDetailView(film: film)
        }
    }
}

#Preview {
    FilmsListView(films: [.sample])
}
