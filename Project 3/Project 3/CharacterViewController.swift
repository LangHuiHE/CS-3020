//
//  CharacterViewController.swift
//  Project 3
//
//  Created by LangHui He on 11/8/21.
//

import UIKit

class CharacterViewController: UITableViewController {
    var store: CharacterStore!
    
    let dataSource = CharacterDataSource()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 190
        print("CharacterViewController loads this page")
        
        tableView.dataSource = dataSource
        
        tableView.delegate = self
        
        // store.fetchCharaters()
        store.fetchCharacters {
            (charactersResult) in
             switch charactersResult {
             case let .success(characters):
                 print("Successfully found \(characters.count) characters.")
                 // print(characters[0].imageURL)
                 self.dataSource.characters = characters
                 // print(self.dataSource.characters.count)
                 // print(self.tableView.numberOfSections)
                 
                 // print(self.dataSource.characters[0].name)
                 // print(self.dataSource.characters[0].status)
                 // print(self.dataSource.characters[0].species)
                 // print(self.dataSource.characters[0].imageURL)
                 
             case let .failure(error):
                 print("Error fetching characters: \(error)")
                 self.dataSource.characters.removeAll()
             }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
         }
        
        // tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let c = dataSource.characters[indexPath.row]

        store.fetchCharactersImage(for: c) { (result) -> Void in

            guard let charIndex = self.dataSource.characters.firstIndex(of: c),
                  case let .success(image) = result
            else {
                return
            }
            let charIndexPath = IndexPath(item: charIndex, section: 0)
            // When the request finishes, find the current cell for this photo
            // print(charIndexPath)
            if let cell = self.tableView.cellForRow(at: charIndexPath) as? CharacterCell {
                // print(cell)
                cell.update(displaying: image)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
            case "showCharacterInfo":
                if let row = tableView.indexPathForSelectedRow?.row {
                    let c = dataSource.characters[row]
                    let destinationVC
                            = segue.destination as! CharacterInfoViewController
                    destinationVC.character = c
                    destinationVC.store = store
                }
            default:
                preconditionFailure("Unexpected segue identifier.")
            }
        }
}
