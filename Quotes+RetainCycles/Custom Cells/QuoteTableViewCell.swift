//
//  QuoteTableViewCell.swift
//  Quotes+RetainCycles
//
//  Created by C4Q  on 2/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

protocol QuoteTableViewCellDelegate: class {
    func userLiked(quote: Quote)
}

class QuoteTableViewCell: UITableViewCell {
    //Public API
    public func configureCell(with newQuote: Quote, and newDelegate: QuoteTableViewCellDelegate?) {
        delegate = newDelegate
        quote = newQuote
    }
    
    //Private implementation
    private weak var delegate: QuoteTableViewCellDelegate?
    private var quote: Quote! {
        didSet {
            quoteLabel.text = "\(quote.text)\n~~~\(quote.author)"
        }
    }
    @IBOutlet private weak var quoteLabel: UILabel!
    @IBAction private func likeButtonPressed(_ sender: Any) {
        delegate?.userLiked(quote: quote)
    }
}
