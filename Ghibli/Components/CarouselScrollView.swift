//
//  CarouselScrollView.swift
//  Ghibli
//
//  Created by Aldo Castro on 10.12.25.
//

import SwiftUI

struct CarouselScrollView: View {
    let films: [Film]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(films) { film in
                    FeaturedFilmCard(film: film)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .defaultScrollAnchor(.center)
        .scrollClipDisabled()
        .contentMargins(.horizontal, 15, for: .scrollContent)
    }
}

#Preview {
    CarouselScrollView(films: Film.samples)
}
