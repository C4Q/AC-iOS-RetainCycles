//
//  Quote.swift
//  Quotes+RetainCycles
//
//  Created by C4Q  on 2/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct Quote: Codable {
    let text: String
    let author: String
    let category: String
    enum CodingKeys: String, CodingKey {
        case text = "quote"
        case author
        case category = "cat"
    }
}
