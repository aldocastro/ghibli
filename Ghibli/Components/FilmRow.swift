//
//  FilmRow.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmRow: View {
    let film: Film

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: film.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure(let error):
                    ContentUnavailableView {
                        Label("Error al cargar la imagen", systemImage: "photo")
                    } description: {
                        Text(error.localizedDescription)
                    }
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 120)
            VStack(alignment: .leading) {
                Text("Título: \(film.title)")
                Text("Director: \(film.director)")
                Text("Puntuación: \(film.scorePercentage)")
            }
        }
    }
}

#Preview {
    FilmRow(film: .sample)
}
