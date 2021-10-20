//
//  InfoViewController.swift
//  Project One
//
//  Created by LangHui on 9/12/21.
//

import UIKit

class InfoViewController: UIViewController {
        
    @IBOutlet var first: UILabel!
    @IBOutlet var last: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var address: UILabel!

    var showInfo:AccountInfo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditPage" {
            let destination = segue.destination as! EditViewController
            
            destination.editInfo = showInfo
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            if let newInfo = showInfo {
                first.text = newInfo.firstName
                last.text = newInfo.lastName
                number.text = newInfo.phoneNumber
                email.text = newInfo.email
                address.text = newInfo.address
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("InfoViewController loaded its view.")
        
        showInfo = AccountInfo()
    }
}
