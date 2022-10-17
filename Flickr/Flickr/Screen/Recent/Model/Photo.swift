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
    let url_z: String?
    let height_z, width_z: Int?
}

extension Photo {
    var iconUrl: URL {
        guard let icon = url_z,
            let iconUrl = URL(string: icon) else {
            let icon = "https://www.computerhope.com/jargon/b/black.jpg",
            iconUrl = URL(string: icon)
            return iconUrl!
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
        url_z = dict["ownername"] as? String
        height_z = dict["height_z"] as? Int
        width_z = dict["width_z"] as? Int
    }
}
