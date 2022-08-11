//
//  Category.swift
//  SoccerStudio
//
//  Created by Luis Marca on 24/07/22.
//

import Foundation

struct CategoryResponse: Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let name: String
    let videos: [Video]
    
    enum CodingKeys: String, CodingKey {
        case name
        case videos = "videos"
    }
}

struct Video: Decodable {
    let name: String
    let thumb: String
    let video: String
    enum CodingKeys: String, CodingKey {
        case thumb
        case name = "label"
        case video
    }
}
