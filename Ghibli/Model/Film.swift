//
//  Film.swift
//  Ghibli
//
//  Created by Aldo Castro on 24.11.25.
//

import Foundation

struct Film: Hashable, Identifiable, Codable {
    let id, title, originalTitle: String
    let image, movieBanner: URL?
    let description, director, producer, releaseDate: String
    let runningTime, rtScore: Int
    let people: [URL?]
}

extension Film {
    var scorePercentage: String {
        "\(rtScore)%"
    }
    
    var yearAndDuration: String {
        "\(releaseDate) ・ \(runningTime) min"
    }

    static var sample: Film = {
        .init(id: "58611129-2dbc-4a81-a72f-77ddfc1b1b49",
              title: "My Neighbor Totoro",
              originalTitle: "となりのトトロ",
              image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg"),
              movieBanner: URL(string: "https://image.tmdb.org/t/p/original/etqr6fOOCXQOgwrQXaKwenTSuzx.jpg"),
              description: "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
              director: "Hayao Miyazaki",
              producer: "Hayao Miyazaki",
              releaseDate: "1988",
              runningTime: 86,
              rtScore: 93,
              people: [
                URL(string: "https://ghibliapi.vercel.app/people/986faac6-67e3-4fb8-a9ee-bad077c2e7fe"),
                URL(string: "https://ghibliapi.vercel.app/people/d5df3c04-f355-4038-833c-83bd3502b6b9"),
                URL(string: "https://ghibliapi.vercel.app/people/3031caa8-eb1a-41c6-ab93-dd091b541e11"),
                URL(string: "https://ghibliapi.vercel.app/people/87b68b97-3774-495b-bf80-495a5f3e672d"),
                URL(string: "https://ghibliapi.vercel.app/people/d39deecb-2bd0-4770-8b45-485f26e1381f"),
                URL(string: "https://ghibliapi.vercel.app/people/591524bc-04fe-4e60-8d61-2425e42ffb2a"),
                URL(string: "https://ghibliapi.vercel.app/people/c491755a-407d-4d6e-b58a-240ec78b5061"),
                URL(string: "https://ghibliapi.vercel.app/people/f467e18e-3694-409f-bdb3-be891ade1106"),
                URL(string: "https://ghibliapi.vercel.app/people/08ffbce4-7f94-476a-95bc-76d3c3969c19"),
                URL(string: "https://ghibliapi.vercel.app/people/0f8ef701-b4c7-4f15-bd15-368c7fe38d0a")
              ]
        )
    }()
    
    static var samples: [Film] = {[
        .init(id: "58611129-2dbc-4a81-a72f-77ddfc1b1b49",
            title: "My Neighbor Totoro",
            originalTitle: "となりのトトロ",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/etqr6fOOCXQOgwrQXaKwenTSuzx.jpg"),
            description: "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
            director: "Hayao Miyazaki",
            producer: "Hayao Miyazaki",
            releaseDate: "1988",
            runningTime: 86,
            rtScore: 93,
            people: [
                URL(string: "https://ghibliapi.vercel.app/people/986faac6-67e3-4fb8-a9ee-bad077c2e7fe"),
                URL(string: "https://ghibliapi.vercel.app/people/d5df3c04-f355-4038-833c-83bd3502b6b9"),
                URL(string: "https://ghibliapi.vercel.app/people/3031caa8-eb1a-41c6-ab93-dd091b541e11"),
                URL(string: "https://ghibliapi.vercel.app/people/87b68b97-3774-495b-bf80-495a5f3e672d"),
                URL(string: "https://ghibliapi.vercel.app/people/d39deecb-2bd0-4770-8b45-485f26e1381f"),
                URL(string: "https://ghibliapi.vercel.app/people/591524bc-04fe-4e60-8d61-2425e42ffb2a"),
                URL(string: "https://ghibliapi.vercel.app/people/c491755a-407d-4d6e-b58a-240ec78b5061"),
                URL(string: "https://ghibliapi.vercel.app/people/f467e18e-3694-409f-bdb3-be891ade1106"),
                URL(string: "https://ghibliapi.vercel.app/people/08ffbce4-7f94-476a-95bc-76d3c3969c19"),
                URL(string: "https://ghibliapi.vercel.app/people/0f8ef701-b4c7-4f15-bd15-368c7fe38d0a")
            ]
        ),
        .init(id: "ea660b10-85c4-4ae3-8a5f-41cea3648e3e",
            title: "Kiki's Delivery Service",
            originalTitle: "魔女の宅急便",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/7nO5DUMnGUuXrA4r2h6ESOKQRrx.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/h5pAEVma835u8xoE60kmLVopLct.jpg"),
            description: "A young witch, on her mandatory year of independent life, finds fitting into a new community difficult while she supports herself by running an air courier service.",
            director: "Hayao Miyazaki",
            producer: "Hayao Miyazaki",
            releaseDate: "1989",
            runningTime: 102,
            rtScore: 96,
            people: [
                URL(string: "https://ghibliapi.vercel.app/people/2409052a-9029-4e8d-bfaf-70fd82c8e48d"),
                URL(string: "https://ghibliapi.vercel.app/people/7151abc6-1a9e-4e6a-9711-ddb50ea572ec"),
                URL(string: "https://ghibliapi.vercel.app/people/1c1a8054-3a34-4185-bfcf-e8011506f09a"),
                URL(string: "https://ghibliapi.vercel.app/people/bc838920-7849-43ea-bfb8-7d5e98dc20b6"),
                URL(string: "https://ghibliapi.vercel.app/people/33f5fea9-c21b-490b-90e0-c4051c372826"),
                URL(string: "https://ghibliapi.vercel.app/people/d1de1c0e-3fcd-4cef-94eb-bb95cc2314aa")
            ]
        ),
        .init(id: "4e236f34-b981-41c3-8c65-f8c9000b94e7",
            title: "Only Yesterday",
            originalTitle: "おもひでぽろぽろ",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/xjJU6rwzLX7Jk8HFQfVW6H5guMC.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/isCrlWWI4JrdLKAUAwFb5cjAsH4.jpg"),
            description: "It’s 1982, and Taeko is 27 years old, unmarried, and has lived her whole life in Tokyo. She decides to visit her family in the countryside, and as the train travels through the night, memories flood back of her younger years: the first immature stirrings of romance, the onset of puberty, and the frustrations of math and boys. At the station she is met by young farmer Toshio, and the encounters with him begin to reconnect her to forgotten longings. In lyrical switches between the present and the past, Taeko contemplates the arc of her life, and wonders if she has been true to the dreams of her childhood self.",
            director: "Isao Takahata",
            producer: "Toshio Suzuki",
            releaseDate: "1991",
            runningTime: 118,
            rtScore: 100,
            people: []
        ),
        .init(id: "ebbb6b7c-945c-41ee-a792-de0e43191bd8",
            title: "Porco Rosso",
            originalTitle: "紅の豚",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/byKAndF6KQSDpGxp1mTr23jPbYp.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/nAeCzilMRXvGaxiCpv63ZRVRVgh.jpg"),
            description: "Porco Rosso, known in Japan as Crimson Pig (Kurenai no Buta) is the sixth animated film by Hayao Miyazaki and released in 1992. You're introduced to an Italian World War I fighter ace, now living as a freelance bounty hunter chasing 'air pirates' in the Adriatic Sea. He has been given a curse that changed his head to that of a pig. Once called Marco Pagot, he is now known to the world as 'Porco Rosso', Italian for 'Red Pig.'",
            director: "Hayao Miyazaki",
            producer: "Toshio Suzuki",
            releaseDate: "1992",
            runningTime: 93,
            rtScore: 94,
            people: []
        ),
        .init(id: "1b67aa9a-2e4a-45af-ac98-64d6ad15b16c",
            title: "Pom Poko",
            originalTitle: "平成狸合戦ぽんぽこ",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/kowo9E1e1JcWLXj9cCvAOFZcy5n.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/jScPd0u0jeo66l8gwDl7W9hDUnM.jpg"),
            description: "As the human city development encroaches on the raccoon population's forest and meadow habitat, the raccoons find themselves faced with the very real possibility of extinction. In response, the raccoons engage in a desperate struggle to stop the construction and preserve their home.",
            director: "Isao Takahata",
            producer: "Toshio Suzuki",
            releaseDate: "1994",
            runningTime: 119,
            rtScore: 78,
            people: []
        ),
        .init(id: "ff24da26-a969-4f0e-ba1e-a122ead6c6e3",
            title: "Whisper of the Heart",
            originalTitle: "耳をすませば",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/5E3Hvbu0bg38ouYf6chGftVGqZ7.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/fRtaDgmj0CirvqFUG1XN48BDY1l.jpg"),
            description: "Shizuku lives a simple life, dominated by her love for stories and writing. One day she notices that all the library books she has have been previously checked out by the same person: 'Seiji Amasawa'. Curious as to who he is, Shizuku meets a boy her age whom she finds infuriating, but discovers to her shock that he is her 'Prince of Books'. As she grows closer to him, she realises that he merely read all those books to bring himself closer to her. The boy Seiji aspires to be a violin maker in Italy, and it is his dreams that make Shizuku realise that she has no clear path for her life. Knowing that her strength lies in writing, she tests her talents by writing a story about Baron, a cat statuette belonging to Seiji's grandfather.",
            director: "Yoshifumi Kondō",
            producer: "Toshio Suzuki",
            releaseDate: "1995",
            runningTime: 111,
            rtScore: 91,
            people: []
        ),
        .init(id: "0440483e-ca0e-4120-8c50-4c8cd9b965d6",
            title: "Princess Mononoke",
            originalTitle: "もののけ姫",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/jHWmNr7m544fJ8eItsfNk8fs2Ed.jpg"),
            movieBanner: URL(string: "https://image.tmdb.org/t/p/original/6pTqSq0zYIWCsucJys8q5L92kUY.jpg"),
            description: "Ashitaka, a prince of the disappearing Ainu tribe, is cursed by a demonized boar god and must journey to the west to find a cure. Along the way, he encounters San, a young human woman fighting to protect the forest, and Lady Eboshi, who is trying to destroy it. Ashitaka must find a way to bring balance to this conflict.",
            director: "Hayao Miyazaki",
            producer: "Toshio Suzuki",
            releaseDate: "1997",
            runningTime: 134,
            rtScore: 92,
            people: [
                URL(string: "https://ghibliapi.vercel.app/people/ba924631-068e-4436-b6de-f3283fa848f0"),
                URL(string: "https://ghibliapi.vercel.app/people/ebe40383-aad2-4208-90ab-698f00c581ab"),
                URL(string: "https://ghibliapi.vercel.app/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b"),
                URL(string: "https://ghibliapi.vercel.app/people/ca568e87-4ce2-4afa-a6c5-51f4ae80a60b"),
                URL(string: "https://ghibliapi.vercel.app/people/e9356bb5-4d4a-4c93-aadc-c83e514bffe3"),
                URL(string: "https://ghibliapi.vercel.app/people/34277bec-7401-43fa-a00a-5aee64b45b08"),
                URL(string: "https://ghibliapi.vercel.app/people/91939012-90b9-46e5-a649-96b898073c82"),
                URL(string: "https://ghibliapi.vercel.app/people/20e3bd33-b35d-41e6-83a4-57ca7f028d38"),
                URL(string: "https://ghibliapi.vercel.app/people/8bccdc78-545b-49f4-a4c8-756163a38c91"),
                URL(string: "https://ghibliapi.vercel.app/people/116bfe1b-3ba8-4fa0-8f72-88537a493cb9")
            ]
        )
    ]}()
}

extension Film {
    func toFavoriteFilm() -> FavoriteFilm {
        .init(
            id: id,
            title: title,
            originalTitle: originalTitle,
            image: image,
            director: director,
            releaseDate: releaseDate,
            rtScore: rtScore
        )
    }
}
