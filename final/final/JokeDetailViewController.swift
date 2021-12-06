//
//  JokeDetailViewController.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import UIKit

class JokeDetailViewController : UIViewController {
    
    @IBOutlet var image: UIImageView!
    var joke : Joke! {
        didSet{
            // navigationItem.title = "\(joke.id)"
            navigationItem.title = joke.author
        }
    }
    var store : JokeStore!
    @IBOutlet var jokeContent: UILabel!
    @IBOutlet var author: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        jokeContent.text = joke.joke
        author.text = joke.author
    }
}

