//
//  FilmDetailView.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import SwiftUI

struct FilmDetailView: View {
    let film: Film
    var body: some View {
        Text(film.title)
    }
}

#Preview {
    FilmDetailView(film: .sample)
}
