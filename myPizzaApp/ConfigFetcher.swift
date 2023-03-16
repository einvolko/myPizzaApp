//
//  ConfigFetcher.swift
//  myPizzaApp
//
//  Created by Михаил Супрун on 16.03.2023.
//

import Foundation

class ConfigFetcher {
    
    let configURL = URL(string: "https://drive.google.com/file/d/1TIqt5aXe2NSbgg0mnuej-pK5oWdBraQW/view?usp=share_link")!
    
    func fetchConfig(completion: @escaping ((Error?, AppConfig?) -> Void)) {
        let request = URLRequest(url: configURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            
            if let error = error {
                print(error)
                completion(error, nil)
                return
            }
            guard let data = data else {return}
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            do {
                let config = try JSONDecoder().decode(AppConfig.self, from: data)
                completion (nil, config)
            } catch {
                print(error)
                completion(error, nil)
            }
        })
        task.resume()
    }
}
