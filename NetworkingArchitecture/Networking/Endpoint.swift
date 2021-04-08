//
//  Endpoint.swift
//  NetworkingArchitecture
//
//  Created by Tashreque Mohammed Haq on 8/4/21.
//

import Foundation

/// The protocol each endpoint must conform to
protocol Endpoint {
    /// HTTPS or HTTP (the protocol)
    var scheme: String { get }
    
    /// The base URL for the endpoint
    var baseUrl: String { get }
    
    /// The path to append to the base URL
    var path: String { get }
    
    /// URL query parameters
    var parameters: [URLQueryItem] { get }
    
    /// GET / POST etc.
    var method: String { get }
}
