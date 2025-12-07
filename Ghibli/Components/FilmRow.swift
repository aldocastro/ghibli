//
//  FilmRow.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmRow: View {
    let film: Film
    let isFavorite: Bool

    var body: some View {
        HStack {
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
                            Label(
                                "Error al cargar la imagen",
                                systemImage: "photo"
                            )
                        } description: {
                            Text(error.localizedDescription)
                        }
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 80, height: 120)

                VStack(alignment: .leading) {
                    Text("\(film.title)")
                    Text("\(film.director)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(film.scorePercentage)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            Spacer()
            Label("Añadido a favoritos", systemImage: "heart.fill")
                .labelStyle(.iconOnly)
                .foregroundStyle(.red)
                .opacity(isFavorite ? 1.0 : 0.0)
        }
    }
}

#Preview {
    FilmRow(film: .sample, isFavorite: true)
}
