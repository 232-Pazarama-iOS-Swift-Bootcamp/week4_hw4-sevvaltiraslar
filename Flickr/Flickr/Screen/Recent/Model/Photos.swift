//
//  Photos.swift
//  Flickr
//
//  Created by SEVVAL on 14.10.2022.
//
/*
import Foundation

struct Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
    
}

struct Photo: Codable {
    var id, owner, secret, server: String?
    var farm: Int?
    var title: String?
    var ispublic, isfriend, isfamily: Int?
    var ownername: String?
    var url_c: String?
    var height_c, width_c: Int?
}

extension Photo {
    var iconUrl: URL {
        guard let icon = url_c, let iconUrl = URL(string: icon) else {
            fatalError("Not found")
        }
        return iconUrl
    }
}

extension Photo {
    init(from dict: [String : Any]) {
        id = dict["id"] as? String
        owner = dict["owner"] as? String
        secret = dict["secret"] as? String
        server = dict["server"] as? String
        farm = dict["farm"] as? Int
        title = dict["title"] as? String
        ispublic = dict["ispublic"] as? Int
        isfriend = dict["isfriend"] as? Int
        isfamily = dict["isfamily"] as? Int
        ownername = dict["ownername"] as? String
        height_c = dict["height_c"] as? Int
        width_c = dict["width_c"] as? Int
    }
}
*/
import Foundation

struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]?
}
