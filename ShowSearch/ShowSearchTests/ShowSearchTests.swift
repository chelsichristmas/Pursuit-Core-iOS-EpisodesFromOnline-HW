//
//  ShowSearchTests.swift
//  ShowSearchTests
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import XCTest
@testable import ShowSearch

class ShowSearchTests: XCTestCase {

    func testGirls() {
        let searchQuery = "girls".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let exp = XCTestExpectation(description: "Searches Found")
        let showEndpointURL = "https://api.tvmaze.com/search/shows?q=\(searchQuery)"
        let request = URLRequest(url: URL(string: showEndpointURL)!)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("appError: \(appError)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 80000, "data should be greater than \(data.count)")
            }
        }
        wait(for: [exp], timeout: 10.0)
    
    }

    
          
//        ShowSearchAPI.fetchShows(for: searchQuery) { (result) in
//            switch result {
//            case .failure(let appError):
//                XCTFail("appError : \(appError)")
//            case .success(let shows):
//                exp.fulfill()
//                XCTAssertEqual(shows.count, expectedShowsCount)
//        }
//              }
//          }
}
