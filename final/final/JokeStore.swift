//
//  JokeStore.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import UIKit

class JokeStore {
    var allItems = [Joke]()
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchJokes(completion: @escaping(Result<[Joke], Error>) -> Void) {
        let url = Api.icndbURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            let result = self.processJokesRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processJokesRequest(data: Data?, error: Error?) -> Result<[Joke], Error> {
         guard let jsonData = data else {
             return .failure(error!)
         }
        return Api.jokes(fromJSON: jsonData)
    }
}

