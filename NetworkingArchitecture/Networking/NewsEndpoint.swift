//
//  NewsEndpoint.swift
//  NetworkingArchitecture
//
//  Created by Tashreque Mohammed Haq on 8/4/21.
//

import Foundation

/// The news endpoint.
enum NewsEndpoint: Endpoint {
    /**
     An endpoint case to get the top headlines based on the specified country.
     */
    case getTopHeadlines(country: String, page: Int)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseUrl: String {
        switch self {
        default:
            return "newsapi.org"
        }
    }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getTopHeadlines(let country, let page):
            return [
                URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "page", value: String(page)),
            ]
        }
    }
    
    var method: String {
        switch self {
        case .getTopHeadlines:
            return "GET"
        }
    }
}
