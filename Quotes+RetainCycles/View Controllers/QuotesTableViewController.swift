//
//  QuotesTableViewController.swift
//  Quotes+RetainCycles
//
//  Created by C4Q  on 2/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {

    var quotes = [Quote]()
    var completionHandler: QuotesHandler?
    var myButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompletionHandler()
        loadQuotes()
        view.addSubview(myButton)
    }
    
    
    
    func setCompletionHandler() {
        completionHandler = {[weak self](quotes, error) in
            if let strongSelf = self {
                if let error = error { print(error) ; return }
                guard let onlineQuotes = quotes else { return }
                strongSelf.quotes = onlineQuotes
                strongSelf.tableView.reloadData()
            }
        }
    }

    func loadQuotes() {
        QuotesAPIClient.manager.getQuotes(handler: completionHandler!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("memory warning")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell
        let quote = quotes[indexPath.row]
        cell.configureCell(with: quote, and: self)
        return cell
    }
}

extension QuotesTableViewController: QuoteTableViewCellDelegate {
    func userLiked(quote: Quote) {
        print("I like it!")
    }
}
