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
    private var photosResponse: PhotosResponse? {
        didSet {
            print(photosResponse)
            self.changeHandler?(.didFetchRecent)
        }
    }
    
    var changeHandler: ((RecentChanges) -> Void)?
    
    /*
    func fetchRecent() {
        provider.request(.getRecentPhotos) { result in
            switch result {
            case .failure(let error):
                self.changeHandler?(.didErrorOccurred(error))
            case .success(let response):
                do {
                    let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
                    self.photosResponse = photosResponse
                } catch {
                    self.changeHandler?(.didErrorOccurred(error))
                }
                
                self.changeHandler?(.didFetchRecent)
            }
        }
    }
    */
    func fetchPhotos() {
        provider.request(.getRecentPhotos) { result in
                switch result {
                case .failure(let error):
                    self.changeHandler?(.didErrorOccurred(error))
                case .success(let response):
                    do {
                        let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
                        self.photosResponse = photosResponse
                    } catch {
                        self.changeHandler?(.didErrorOccurred(error))
                    }
                }
            }
        }
    
}
