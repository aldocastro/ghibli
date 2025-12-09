//
//  TitleValueRow.swift
//  Ghibli
//
//  Created by Aldo Castro on 05.12.25.
//

import SwiftUI

struct TitleValueRow: View {
    let title: String
    let titleColor: Color
    let image: String
    var value: Int

    var body: some View {
        HStack {
            Label(title, systemImage: image)
                .foregroundStyle(titleColor)
            Spacer()
            Text("\(value)")
                .font(.caption.bold())
        }
    }
}

#Preview {
    TitleValueRow(
        title: "Total of films",
        titleColor: .blue,
        image: "film.fill",
        value: 100
    )
}
