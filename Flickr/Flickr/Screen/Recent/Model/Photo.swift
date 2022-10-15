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
    let datetaken: String?
    let datetakengranularity: Int?
    let datetakenunknown, ownername: String?
    let url_c: String?
    let height_c, width_c: Int?
    //let url_m: String?
    //let height_m, width_m: Int?
    
    //    enum CodingKeys: String, CodingKey {
    //        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily, datetaken, datetakengranularity, datetakenunknown, ownername
    //        case urlZ = "url_z"
    //        case heightZ = "height_z"
    //        case widthZ = "width_z"
    //    }
}
/*
extension Photo {
    var iconUrl: URL {
        guard let icon = url_z,
              let iconUrl = URL(string: icon) else {
            guard let icon = url_m,
                  let iconUrl = URL(string: icon) else {
                let icon = "https://www.computerhope.com/jargon/b/black.jpg",
                iconUrl = URL(string: icon)
                return iconUrl!
            }
            return iconUrl
        }
        return iconUrl
    }
}
*/
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
        datetaken = dict["datetaken"] as? String
        datetakengranularity = dict["datetakengranularity"] as? Int
        datetakenunknown = dict["datetakenunknown"] as? String
        ownername = dict["ownername"] as? String
        url_c = dict["url_z"] as? String
        //url_m = dict["url_m"] as? String
        height_c = dict["height_c"] as? Int
        width_c = dict["width_c"] as? Int
        //height_m = dict["heightZ"] as? Int
        //width_m = dict["widthZ"] as? Int
    } 
}
