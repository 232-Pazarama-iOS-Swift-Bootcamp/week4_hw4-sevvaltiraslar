//
//  SearchViewController.swift
//  Flickr
//
//  Created by SEVVAL on 17.10.2022.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: RecentViewModel
    
    // MARK: - Init
    init(viewModel: RecentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        viewModel.fetchPhotos()
        viewModel.changeHandler = { change in
            switch change {
            case .didFetchRecent:
                self.collectionView.reloadData()
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension SearchViewController: UICollectionViewDelegate {
    
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        guard let recent = viewModel.photoForIndexPath(indexPath) else {
            fatalError("Photo not found")
        }
        cell.title = recent.title
        cell.imageView.kf.setImage(with: recent.iconUrl)
        return cell
    }
    
    
    
}
