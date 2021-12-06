//
//  JokeDataSource.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import UIKit

class JokeDataSource: NSObject,UITableViewDataSource {
    var jokes = [Joke]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return jokes.count
     }
     
     func tableView(_ tableView: UITableView,
             cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell",
                 for: indexPath) as! JokeCell
         
         let c = jokes[indexPath.row]
         
         cell.id?.text = "\(c.id)"
         cell.jokeString?.text = c.joke
         
         return cell
     }
}
