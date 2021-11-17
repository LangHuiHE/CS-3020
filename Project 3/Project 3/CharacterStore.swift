//
//  CharacterStore.swift
//  Project 3
//
//  Created by LangHui He on 11/8/21.
//

import UIKit

enum ImageError: Error {
    case imageCreationError
    case missingImageURL
}

class CharacterStore {
    var allItems = [Character]()    
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchCharacters(completion: @escaping(Result<[Character], Error>) -> Void) {
        let url = RickandMortyAPI.charactesURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            let result = self.processCharactersRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processCharactersRequest(data: Data?, error: Error?) -> Result<[Character], Error> {
         guard let jsonData = data else {
             return .failure(error!)
         }
        return RickandMortyAPI.characters(fromJSON: jsonData)
    }
    
    func fetchCharactersImage(for character: Character, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let imageLink = character.imageURL else {
            completion(.failure(ImageError.missingImageURL))
            return
        }
        let request = URLRequest(url: imageLink)

        let task = session.dataTask(with: request) {
            (data, response, error) in
            let result = self.processCharacterImageRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
     }
    
    private func processCharacterImageRequest(data: Data?, error: Error?) -> Result<UIImage, Error> {
         guard
             let imageData = data,
             let image = UIImage(data: imageData) else {
             // Couldn't create an image
             if data == nil {
                 return .failure(error!)
             } else {
                 return .failure(ImageError.imageCreationError)
             }
         }

         return .success(image)
     }
    
}
