//
//  NewsService.swift
//  News
//
//  Created by Petro Starychok on 19.02.2021.
//

import Foundation

class NewsService {
    
    static let url = URL(string: "https://ua-news-1.herokuapp.com/v1/news/getNews")!
    
    static func getNews(_ completion: @escaping ([NewsModel]?) -> Void) {
        URLSession.shared.dataTask(with: url) {data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                let news = try decoder.decode([NewsModel].self, from: data)
                DispatchQueue.main.async {
                    completion(news)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil)
                }
                print("something wrong after downloaded")
            }
        }.resume()
    }
}
