//
//  AppError.swift
//  ShowSearch
//
//  Created by Chelsi Christmas on 12/13/19.
//  Copyright © 2019 Chelsi Christmas. All rights reserved.
//

import Foundation


enum AppError: Error {
  case badURL(String)
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String)
}
