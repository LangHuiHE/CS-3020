//
//  JokeTableViewController.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import UIKit

class JokeTableViewController: UITableViewController {
    var store: JokeStore!
    
    let dataSource = JokeDataSource()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 140
        print("JokeTableViewController loads this page")
        
        tableView.dataSource = dataSource
        
        tableView.delegate = self
        
        // store.fetchCharaters()
        store.fetchJokes {
            (jokeResult) in
             switch jokeResult {
             case let .success(jokes):
                 print("Successfully found \(jokes.count) jokes.")
                 self.dataSource.jokes = jokes
        
             case let .failure(error):
                 print("Error fetching jokes: \(error)")
                 self.dataSource.jokes.removeAll()
             }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
         }
        
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
            case "showJokeDetail":
                if let row = tableView.indexPathForSelectedRow?.row {
                    let c = dataSource.jokes[row]
                    let destinationVC
                            = segue.destination as! JokeDetailViewController
                    destinationVC.joke = c
                    destinationVC.store = store
                }
            default:
                preconditionFailure("Unexpected segue identifier.")
            }
        }
}

