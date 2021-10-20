//
//  ShoppingCartController.swift
//  Project 2
//
//  Created by LangHui on 10/17/21.
//

import UIKit

class ShoppingCartController : UITableViewController {
    override func viewDidLoad() {
        tableView.rowHeight = 180
        print("ShoppingCartController loads this page")
    }
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
            /*
            // Make a new index path for the 0th section, last row
            let lastRow = tableView.numberOfRows(inSection: 0)
                let indexPath = IndexPath(row: lastRow, section: 0)
                // Insert this new row into the table
                tableView.insertRows(at: [indexPath], with: .automatic)
            */
            // Create a new item and add it to the store
                let newItem = itemStore.createItem()

                // Figure out where that item is in the array
                if let index = itemStore.allItems.firstIndex(of: newItem) {
                    let indexPath = IndexPath(row: index, section: 0)

                    // Insert this new row into the table
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
        
        override func tableView(_ tableView: UITableView,
                                commit editingStyle: UITableViewCell.EditingStyle,
                                forRowAt indexPath: IndexPath) {
            // If the table view is asking to commit a delete command...
            if editingStyle == .delete {
                let item = itemStore.allItems[indexPath.row]
                // Remove the item from the store
                    itemStore.removeItem(item)

                    // Also remove that row from the table view with an animation
                    tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell with default appearance
        
        // let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemRowCell",
                for: indexPath) as! CartItemRowCell
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        let item = itemStore.allItems[indexPath.row]

        cell.name?.text = item.name
        cell.value?.text = "$\(item.valueInDollars)"
        cell.quantity?.text = "\(item.quantity)"
        cell.subTotal?.text = "$\(item.subTotal)"
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "CartItem":
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {

                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let CartItemController
                        = segue.destination as! CartItemController
                CartItemController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
}
