//
//  FavoritesView.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView {
                Label("Sin Favoritas", systemImage: "heart.slash")
            } description: {
                Text("Aún no has guardado ninguna película favorita")
            }
            .navigationTitle("Favoritas")
        }
    }
}
