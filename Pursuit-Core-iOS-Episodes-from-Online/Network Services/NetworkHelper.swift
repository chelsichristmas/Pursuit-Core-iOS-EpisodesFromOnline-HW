//
//  NetworkHelper.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation


class NetworkHelper {
  
  static let shared = NetworkHelper()
  
  private var session: URLSession
  
  private init() {
    session = URLSession(configuration: .default)
  }
  
  func performDataTask(with request: URLRequest,
                       completion: @escaping (Result<Data, AppError>) -> ()) {
    
    
    let dataTask = session.dataTask(with: request) { (data, response, error) in
      
      if let error = error {
        completion(.failure(.networkClientError(error)))
      }
      
      
      guard let urlResponse = response as? HTTPURLResponse else {
        completion(.failure(.noResponse))
        return
      }
      

      guard let data = data else {
        completion(.failure(.noData))
        return
      }
      
      
      switch urlResponse.statusCode {
      case 200...299: break // everything went well here
      default:
        completion(.failure(.badStatusCode(urlResponse.statusCode)))
        return
      }
      
      // 5. capture data as success case
      completion(.success(data))
    }
    dataTask.resume()
    
  }
  
}

