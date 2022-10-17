//
//  RecentViewModel.swift
//  Flickr
//
//  Created by SEVVAL on 14.10.2022.
//

import Moya

enum RecentChanges {
    case didErrorOccurred(_ error: Error)
    case didFetchRecent
}

final class RecentViewModel {
    
    private let provider = MoyaProvider<FlickrAPI>()
    var photosResponse: PhotosResponse? {
        didSet {
            self.changeHandler?(.didFetchRecent)
        }
    }
    
    var changeHandler: ((RecentChanges) -> Void)?

    /*var numberOfRows: Int {
        photosResponse?.photos?.photo.
    }*/
    
    func fetchPhotos() {
        provider.request(.getRecentPhotos) { result in
                switch result {
                case .failure(let error):
                    self.changeHandler?(.didErrorOccurred(error))
                case .success(let response):
                    do {
                        //let data = String(decoding: response.data, as: UTF8.self)
                        //print(data)
                        let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
                        self.photosResponse = photosResponse
                    } catch {
                        self.changeHandler?(.didErrorOccurred(error))
                    }
                }
            }
        }
    
    /*func photoForIndexPath(_ indexPath: IndexPath) -> Photo? {
        photosResponse?.photos?.photo?[indexPath.row]
    }*/
    
}
