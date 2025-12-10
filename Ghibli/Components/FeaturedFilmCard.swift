//
//  FeaturedFilmCard.swift
//  Ghibli
//
//  Created by Aldo Castro on 10.12.25.
//

import SwiftUI

struct FeaturedFilmCard: View {
    let film: Film
    static let maxWidth = 300.0
    static let maxHeight = 200.0
    static let spacing = 20.0

    var body: some View {
        AsyncImage(url: film.movieBanner) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                ZStack {
                    LinearGradient(
                        colors: [.gray.opacity(0.75), .white],
                        startPoint: .top, endPoint: .bottom)
                    Label("Failed to load image", systemImage: "photo")
                        .labelStyle(.iconOnly)
                        .font(.title)
                        .frame(
                            width: FeaturedFilmCard.maxWidth,
                            height: FeaturedFilmCard.maxHeight
                        )
                }
            @unknown default:
                EmptyView()
            }
        }
        .overlay(alignment: .bottomLeading) {
            info
                .padding()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [
                            .black.opacity(0.8),
                            .clear,
                        ],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(
            minWidth: 0, maxWidth: FeaturedFilmCard.maxWidth,
            minHeight: 0, maxHeight: FeaturedFilmCard.maxHeight
        )
    }

    private var info: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(film.title)
                    .font(.title3.bold())
                Text(film.director)
                    .font(.subheadline)
                HStack(alignment: .bottom) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text(film.scorePercentage)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    FeaturedFilmCard(film: .sample)
}
