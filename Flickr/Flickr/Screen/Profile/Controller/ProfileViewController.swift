//
//  ProfileViewController.swift
//  Flickr
//
//  Created by SEVVAL on 17.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    
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
        
        self.nameLabel.text = "sevval"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
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
    @IBAction func signOutClicked(_ sender: Any) {
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        guard let recent = viewModel.photoForIndexPath(indexPath) else {
            fatalError("Photo not found")
        }
        cell.imageView.kf.setImage(with: recent.iconUrl)
        return cell
    }
    
    
}
