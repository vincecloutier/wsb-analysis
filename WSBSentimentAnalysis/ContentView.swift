//
//  ContentView.swift
//  WSBSentimentAnalysis
//
//  Created by Vincent Cloutier on 2021-10-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModelImpl(service: ServiceImpl())
    var body: some View {
        Group {
            if vm.stocks.isEmpty {
                ProgressView()
            } else {
                NavigationView {
                    
                    List {
                        ForEach(vm.stocks, id: \.ticker) { item in
                            VStack (alignment: .leading) {
                                Text("\(item.ticker) is \(item.sentiment.lowercased())")
                                    .font(.title)
                                    .bold()
                                Text("\(item.no_of_comments) comments with a strength of \(String(format: "%.01f", arguments: [item.sentiment_score]))")
                                    .font(.caption)
                            }
                        }
                    }
                    .navigationBarTitle("Reddit Analysis ")
                }
            }
        }
        .task {
            await vm.getStocks()
        }
        
    }
}

