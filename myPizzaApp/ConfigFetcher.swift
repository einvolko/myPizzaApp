//
//  ConfigFetcher.swift
//  myPizzaApp
//
//  Created by Михаил Супрун on 16.03.2023.
//

import Foundation

class ConfigFetcher {
    
    let configURL = URL(string: "https://raw.githubusercontent.com/einvolko/myPizzaApp/main/Source/PizzaSource.json?token=GHSAT0AAAAAAB7THJVQLSDAOPIUCTYT7EW6ZATB4FQ")!
    
    func fetchConfig(completion: @escaping ((Error?, AppConfig?) -> Void)) {
        let request = URLRequest(url: configURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            print("Ok")
            
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
