//
//  NetworkHelper.swift
//  Quotes+RetainCycles
//
//  Created by C4Q  on 2/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

enum AppError: Error {
    case noData
}

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    func performDataTask(with request: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        self.urlSession.dataTask(with: request){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.noData); return}
                
                if let error = error {
                    errorHandler(error)
                }
                completionHandler(data)
                
            }
            }.resume()
    }
}
