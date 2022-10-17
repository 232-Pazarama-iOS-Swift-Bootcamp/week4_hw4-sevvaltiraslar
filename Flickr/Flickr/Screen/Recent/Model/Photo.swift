//
//  Photo.swift
//  Flickr
//
//  Created by SEVVAL on 15.10.2022.
//

import Foundation

struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    let ownername: String?
    let url_c: String?
    let height_c, width_c: Int?
}

extension Photo {
    var iconUrl: URL {
        guard let icon = url_c,
            let iconUrl = URL(string: icon) else {
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
        ownername = dict["url_c"] as? String
        url_c = dict["ownername"] as? String
        height_c = dict["height_c"] as? Int
        width_c = dict["width_c"] as? Int
    }
}
