//
//  FilmDetailView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    @Environment(FavoritesViewModel.self) private var favoritesViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BannerImageView(movieBanner: film.movieBanner)
                Headline(
                    film: film,
                    isFavorite: favoritesViewModel.isFavorite(filmId: film.id),
                    toggleFavorite: {
                        favoritesViewModel.toggleFavorite(filmId: film.id)
                    }
                )
                FilmMakers(director: film.director, producer: film.producer)
                Summary(description: film.description)
            }
        }
    }
}

fileprivate struct BannerImageView: View {
    let movieBanner: URL?

    var body: some View {
        AsyncImage(url: movieBanner) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(let error):
                ContentUnavailableView {
                    Label("Failed to load image", systemImage: "photo")
                } description: {
                    Text("\(error.localizedDescription)")
                }
            @unknown default:
                EmptyView()
            }
        }
        .padding(.bottom)
    }
}

fileprivate struct Headline: View {
    let film: Film
    let isFavorite: Bool
    let toggleFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7.0) {
            Text(film.title)
                .font(.title.bold())
            Text(film.originalTitle)
                .font(.title2)
                .foregroundStyle(.gray)
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(film.scorePercentage)
                            .font(.title3.bold())
                    }
                    Text(film.yearAndDuration)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Button {
                    toggleFavorite()
                } label: {
                    let (imgName, lblText) =
                        isFavorite
                        ? ("heart.fill", "Quita de favoritos")
                        : ("heart", "Añade a favoritos")
                    Label(lblText, systemImage: imgName)
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.red)
                }
            }
        }
        .padding(10.0)
    }
}

fileprivate struct FilmMakers: View {
    let director: String
    let producer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7.0) {
            HStack {
                Text("Director")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                Text(director)
                    .font(.headline)
            }
            HStack {
                Text("Producer")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Spacer()
                Text(producer)
                    .font(.headline)
            }
        }
        .padding(10.0)
    }
}

fileprivate struct Summary: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7.0) {
            Text("Sipnosis")
                .font(.title3.bold())
            Text(description)
        }
        .padding(10.0)
    }
}

#Preview {
    FilmDetailView(film: .sample)
        .environment(FavoritesViewModel())
}
