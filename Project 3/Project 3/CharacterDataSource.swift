//
//  CharacterDataSource.swift
//  Project 3
//
//  Created by LangHui He on 11/11/21.
//

import UIKit

class CharacterDataSource: NSObject,UITableViewDataSource {
    var characters = [Character]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return characters.count
     }
     
     func tableView(_ tableView: UITableView,
             cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell",
                 for: indexPath) as! CharacterCell
         
         let c = characters[indexPath.row]
         
         cell.name?.text = c.name
         cell.status?.text = c.status
         cell.species?.text = c.species
         cell.gender?.text = c.gender
         cell.update(displaying: nil)
         
         return cell
     }
}
