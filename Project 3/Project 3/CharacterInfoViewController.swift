//
//  CharacterInfoViewController.swift
//  Project 3
//
//  Created by LangHui He on 11/15/21.
//

import UIKit

class CharacterInfoViewController : UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var species: UILabel!
    @IBOutlet var gender: UILabel!
    
    
    var character : Character! {
        didSet {
            navigationItem.title = character.name
        }
    }
    
    var store : CharacterStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if character.characterImage == nil {
            store.fetchCharactersImage(for: character) { (result) -> Void in
                switch result {
                case let .success(image):
                    self.imageView.image = image
                case let .failure(error):
                    print("Error fetching image for character: \(error)")
                }
            }
        } else {
            imageView.image = character.characterImage
        }
        
        name.text = character.name
        status.text = character.status
        species.text = character.species
        gender.text = character.gender
    }
}
