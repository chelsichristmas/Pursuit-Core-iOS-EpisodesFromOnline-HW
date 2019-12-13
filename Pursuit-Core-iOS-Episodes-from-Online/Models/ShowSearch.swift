//
//  ShowSearch.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowSearch: Decodable {
    var show: [Details]
}

struct Details: Decodable {
    var name: String
    var rating: Rating
    var image: Image
}

struct Rating: Decodable {
    var average: Double
}

struct Image: Decodable {
    var medium: String
    var original: String
}
