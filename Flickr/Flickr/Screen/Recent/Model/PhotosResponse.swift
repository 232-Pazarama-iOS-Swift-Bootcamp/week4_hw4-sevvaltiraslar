//
//  PhotoResponse.swift
//  Flickr
//
//  Created by SEVVAL on 14.10.2022.
//

import Foundation

struct PhotosResponse: Decodable {
    let photos: Photos?
    let stat: String?
}

