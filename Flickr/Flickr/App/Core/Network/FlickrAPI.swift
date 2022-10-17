//
//  FlickrAPI.swift
//  Flickr
//
//  Created by SEVVAL on 14.10.2022.
//

import Moya

let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
let provider = MoyaProvider<FlickrAPI>(plugins: [plugin])

enum FlickrAPI {
    case getRecentPhotos
}

// MARK: - TargetType
extension FlickrAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://www.flickr.com/services/rest") else {
            fatalError("Base URL not found or not in correct format.")
        }
        return url
    }
    
    var path: String {
        "/"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        let parameters: [String : Any] = ["method" : "flickr.photos.getRecent",
                                          "api_key" : "2cc326464820de2df62383eb39da8f19",
                                          "extras" : "owner_name,url_z",
                                          "format" : "json",
                                          "nojsoncallback" : 1]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        nil
    }
    
}
