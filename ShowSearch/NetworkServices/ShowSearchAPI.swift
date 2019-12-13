//
//  ShowSearchAPI.swift
//  ShowSearch
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//


import Foundation

struct ShowSearchAPI {
    
    
    static func fetchShows(for searchQuery: String, completion: @escaping (Result<[Details], AppError>) ->()) {
        
        let searchQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Lost"
        
        let episodeEndpointURL = "http://api.tvmaze.com/search/shows?q=\(searchQuery)"
        
        
        
        guard let url = URL(string: episodeEndpointURL) else {
            completion(.failure(.badURL(episodeEndpointURL)))
            return
            }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure (let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searchResults = try JSONDecoder().decode(ShowSearch.self, from: data)
                    // 1. use search results to create an array of recipes
                    let shows = searchResults.show
                // 2 . capture the array of recipes in the completion handler
                    completion(.success(shows))
                    
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
