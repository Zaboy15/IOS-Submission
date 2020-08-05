//
//  Game.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import UIKit

struct Games: Codable {
    
    let games: [Game]
    
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
        
    }
}

struct Game: Codable, Identifiable {
    let id: Int
    let gamePath: String
    let name: String
    let released: String
    let image: String
    let rating: Double
    let ratings_count: Double
    let reviews_count: Double
    let genre: [Genres]
    
    enum CodingKeys: String, CodingKey {
        case id
        case gamePath
        case name
        case released
        case image = "background_image"
        case rating
        case ratings_count
        case reviews_count
        case genre = "genres"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        let id = try container.decode(Int.self, forKey: .id)
        gamePath = "https://api.rawg.io/api/games/\(id)"
        name = try container.decode(String.self, forKey: .name)
        released = try container.decode(String.self, forKey: .released)
        image = try container.decode(String.self, forKey: .image)
        rating = try container.decode(Double.self, forKey: .rating)
        ratings_count = try container.decode(Double.self, forKey: .ratings_count)
        reviews_count = try container.decode(Double.self, forKey: .reviews_count)
        genre = try container.decode([Genres].self, forKey: .genre)
    }
}

struct Genres: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        slug = try container.decode(String.self, forKey: .slug)
    }
}
