//
//  NewsApi.swift
//  RooitTest
//
//  Created by YASYUAN LINANG on 2023/9/17.
//

import Foundation
import Moya
import RealmSwift


protocol DecodableResponseTargetType: TargetType {
  associatedtype ResponseType: Decodable
}

protocol NewsApiTargetType: DecodableResponseTargetType {}
extension NewsApiTargetType {
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=5122598a301d48a6b573b6119cb7f265")!
    }
    var headers: [String : String]? {
        return nil
    }
}

enum NewsApi {
    struct GetNews: NewsApiTargetType {
        typealias ResponseType = Datas
        var method: Moya.Method {
            return .get
        }
        var path: String {
            return ""
        }
        var task: Task {
            return .requestPlain
        }
    }
}

class Datas: Codable {
    var status: String?
    var totalResults: Int = 0
    var articles: [Article]?
}

class Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var url: String?
}
class Source: Codable {
    var id: String?
    var name: String?
}

class NewsItem: Object {
    @objc dynamic var title = ""
    @objc dynamic var url = ""
    @objc dynamic var image = ""
}
