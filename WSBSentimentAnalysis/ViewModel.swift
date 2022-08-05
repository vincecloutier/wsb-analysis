//
//  ViewModel.swift
//  WSBSentimentAnalysis
//
//  Created by Vincent Cloutier on 2021-10-14.
//

import Foundation

// ADDING THE STOCKS TO THE ARRAY
protocol ViewModel: ObservableObject {
    func getStocks() async
}

@MainActor // You need this w/ async await to signify you want to update this on the main thread
final class ViewModelImpl: ViewModel {
    
    
    @Published private(set) var stocks: [Stock] = []
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
    }
    func getStocks() async {
        do {
            self.stocks = try await service.fetchStocks()
        } catch {
            print(error)
        }
    }
}
