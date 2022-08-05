//
//  Model.swift
//  WSBSentimentAnalysis
//
//  Created by Vincent Cloutier on 2021-10-14.
//

import Foundation

// DEFINE BASE URL
enum APIConstants {
    static let baseURL = "https://dashboard.nbshare.io/api/v1/apps"
}

// CREATING A DATA TYPE TO STORE EACH STOCK
struct Stock: Decodable {
    let no_of_comments: Int
    let sentiment: String
    let sentiment_score: Float
    let ticker: String
}
