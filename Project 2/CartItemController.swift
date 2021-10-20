//
//  CartItemController.swift
//  Project 2
//
//  Created by LangHui on 10/17/21.
//

import UIKit

class CartItemController : UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        print("CartItemController loads this page")
    }
    
    
    @IBOutlet var serialLabel: UILabel!
    
    @IBOutlet var crateDateLabel: UILabel!
    
    @IBOutlet var modifyDateLabel: UILabel!
    
    @IBOutlet var priceLable: UILabel!
    
    @IBOutlet var quantityField: UITextField!

    @IBAction func min(_ sender: UIButton) {
        if item.quantity > 1 {
            if let newNumberText = quantityField.text,
               let newNumber = Int(newNumberText) {
                quantityField.text = "\(newNumber - 1)"
            }
        }
    }

    
    @IBAction func add(_ sender: UIButton) {
        if let newNumberText = quantityField.text,
           let newNumber = Int(newNumberText) {
            quantityField.text = "\(newNumber + 1)"
        }
    }
    
    
    
    var item: Item!{
        didSet {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        serialLabel.text = item.serialNumber
        crateDateLabel.text = dateFormatter.string(from: item.dateCreated)
        modifyDateLabel.text = dateFormatter.string(from: item.dateMotified)
        priceLable.text = "$\(item.valueInDollars)"
        quantityField.text = "\(item.quantity)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    @IBAction func TapSomewhereElse(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
            view.endEditing(true)
    
        // "Save" changes to item
        if let newNumberText = quantityField.text,
           let newNumber = Int(newNumberText) {
            if item.quantity != newNumber {
                item.quantity = newNumber
                item.updateSubtotal()
                item.dateMotified = Date()
            }
        }
    }
}
