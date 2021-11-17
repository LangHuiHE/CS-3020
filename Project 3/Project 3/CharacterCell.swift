//
//  CharacterCell.swift
//  Project 3
//
//  Created by LangHui He on 11/8/21.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var species: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            characterImage.image = imageToDisplay
        } else {
            spinner.startAnimating()
            characterImage.image = nil
        }
    }
}
