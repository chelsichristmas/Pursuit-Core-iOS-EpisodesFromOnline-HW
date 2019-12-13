//
//  Pursuit_Core_iOS_Episodes_from_OnlineTests.swift
//  Pursuit-Core-iOS-Episodes-from-OnlineTests
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import Pursuit-Core-iOS-Episodes-from-Online

class ShowSearchAPITests: XCTestCase {

    func testChristmasCookies() {
        //arrange
        //convert string to url friendly string
        let searchQuery = "girls".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let exp = XCTestExpectation(description: "searches found")
        let recipeEndpointURL = " http://api.tvmaze.com/search/shows?q=\(searchQuery)"
        
        let request = URLRequest(url: URL(string:showEndpointURL)!)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("appError: \(appError)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 800000, "data should be greater than \(data.count)")
            }
    }
        
        wait(for: [exp], timeout: 5.0)
}
    
    // TODO: write an asynchronous test to validate you do get back 50 recipes for the "christmas cookies" search from fetchRecipes function
    
    
    func testFetchRecipes() {
        // arrange
        
        let expectedRecipesCount = 50
        let exp = XCTestExpectation(description: "recipes found")
        let searchQuery = "christmas cookies"
        
        // act
        RecipeSearchAPI.fetchRecipe(for: searchQuery) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("appError : \(appError)")
            case .success(let recipes):
                exp.fulfill()
                XCTAssertEqual(recipes.count, expectedRecipesCount)
            }
        }
        wait(for: [exp], timeout: 30.0)
    }
    
    // must have an expectation and a wait, and expectation fulfill
}
