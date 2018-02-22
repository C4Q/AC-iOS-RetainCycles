//
//  QuotesAPIClient.swift
//  Quotes+RetainCycles
//
//  Created by C4Q  on 2/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

typealias QuotesHandler = ([Quote]?, Error?) -> Void

struct QuotesAPIClient {
    private init() {}
    static let manager = QuotesAPIClient()
    private let endpoint = "https://talaikis.com/api/quotes/"
    func getQuotes(handler: @escaping QuotesHandler) {
        let request = URLRequest(url: URL(string: endpoint)!)
        let completion: (Data) -> Void = {(data) in
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                handler(quotes, nil)
            }
            catch {
                handler(nil, error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: {print($0)})
    }
}
