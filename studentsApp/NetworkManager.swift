//
//  NetworkManager.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 3/24/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

  class NetworkManager {

  static let shared = NetworkManager()

    var swPeople: [Student] = []
    
    func fetchData(urlSuffix: Int) {
        //var urlSuffix:Int = 1
        let session = URLSession.shared
        let url = URL(string: "https://swapi.co/api/people/?page=1")
        guard let uri = url else { return }
        var components = URLComponents()
        components.path = uri.path
        components.scheme = uri.scheme
        components.host = uri.host
        components.queryItems = [URLQueryItem(name: "page", value: String(urlSuffix))]
        var request = URLRequest(url:components.url!)
        request.httpMethod = "GET"
        //request.httpBody - post only
        //let task = session.dataTask(with: uri) { ( data, responce, error )
        let task = session.dataTask(with: request) { ( data, responce, error )
            in
            guard let data = data else { return }
            guard error == nil else {return}
            guard let responce = responce as? HTTPURLResponse,
                (200...299).contains(responce.statusCode)
            else {return}
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
//                print(json)
//                let people = json?.value(forKey: "results") as? NSArray
//                print(people)
                let json = try JSONDecoder().decode(SWPeople.self, from: data)
                //print(json)
                json.people.forEach {
                    print($0.name)
                    self.swPeople.append(Student(name: $0.name, surname: "", gender: .other))
                }
            } catch {
                
            }
        }
        task.resume()
    }
}

struct SWPeople:Codable {
    let count: Int
    let next: String
    let people: [SWChar]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case people = "results"
    }
}

struct SWChar: Codable {
    let name: String
}

