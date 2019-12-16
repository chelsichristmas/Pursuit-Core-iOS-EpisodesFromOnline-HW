//
//  ShowSearch.swift
//  ShowSearch
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation

struct ShowSearch: Decodable {
    var show: ShowInfo
}

struct ShowInfo: Decodable {
    var name: String
    var rating: Rating
    var image: Image?
}

struct Rating: Decodable {
    var average: Double?
}

struct Image: Decodable {
    var medium: String
    var original: String
}

