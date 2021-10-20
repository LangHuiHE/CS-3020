//
//  EditViewController.swift
//  Project One
//
//  Created by LangHui on 9/12/21.
//

import UIKit

class EditViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("EditViewController loaded its view.")
    }
    
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var number: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var address: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        number.resignFirstResponder()
        email.resignFirstResponder()
        address.resignFirstResponder()
    }
    
    @IBOutlet var first: UILabel!
    @IBOutlet var last: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var editInfo: AccountInfo?
    
    @IBAction func updata(_ sender: Any) {
        first.text = firstName.text
        last.text = lastName.text
        numberLabel.text = number.text
        emailLabel.text = email.text
        addressLabel.text = address.text
        if let info = editInfo {
            info.firstName = firstName.text
            info.lastName = lastName.text
            info.phoneNumber = number.text
            info.email = email.text
            info.address = address.text
        }
    }
}
