//
//  APICaller.swift
//  API-Learning
//
//  Created by Maurice Baumann on 5/21/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=de&apiKey=#")
        static let searchUrlString = "https://newsapi.org/v2/everything?sortedBy=popularity&apiKey=#&q="
        
        static let americaURLString = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=#")
        static let frenchURLString = URL(string: "https://newsapi.org/v2/top-headlines?country=fr&apiKey=#")
        static let italienURLString = URL(string: "https://newsapi.org/v2/top-headlines?country=it&apiKey=#")
        static let austrianURLString = URL(string: "https://newsapi.org/v2/top-headlines?country=at&apiKey=#")
        
        static let techNews = URL(string: "https://newsapi.org/v2/everything?q=technology&apiKey=#")
        static let buisNews = URL(string: "https://newsapi.org/v2/everything?q=business&apiKey=#")
        static let healNews = URL(string: "https://newsapi.org/v2/everything?q=health&apiKey=#")
        static let sportNews = URL(string: "https://newsapi.org/v2/everything?q=sport&apiKey=#")
    }
    
    private init() {}
        
    public func search(with query: String, completion: @escaping (Result<[Article], Error>) -> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.topHeadLinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getUSStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.americaURLString else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getFRStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.frenchURLString else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getITStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.italienURLString else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getATStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.austrianURLString else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func getTechStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.techNews else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getBusinessStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.buisNews else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getHealthStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.healNews else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func getSportStorys(completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url = Constants.sportNews else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}

//Models
struct APIResponse: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}
struct Source: Codable{
    let name: String
}
