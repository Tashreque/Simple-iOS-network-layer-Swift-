//
//  News.swift
//  NetworkingArchitecture
//
//  Created by Tashreque Mohammed Haq on 8/4/21.
//

import Foundation

// MARK: - Welcome
struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
