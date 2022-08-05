//
//  Service.swift
//  WSBSentimentAnalysis
//
//  Created by Vincent Cloutier on 2021-10-14.
//

import Foundation

//PULLING THE STOCKS
protocol Service {
    func fetchStocks() async throws -> [Stock]
}
 
final class ServiceImpl: Service {
    func fetchStocks() async throws -> [Stock] {
        let urlSession = URLSession.shared // Start URL Session
        let url = URL(string: APIConstants.baseURL.appending("/reddit")) // Append to API constant
        let (data, _) = try await urlSession.data(from: url!) // Talk to API
        return try JSONDecoder().decode([Stock].self, from: data) // If successful decode data if not throw an error
    }
}
