//
//  RecentViewController.swift
//  Flickr
//
//  Created by SEVVAL on 19.10.2022.
//

import UIKit
import Kingfisher

final class RecentViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: RecentViewModel
    
    // MARK: - Init
    init(viewModel: RecentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recent"
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "RecentTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        viewModel.fetchPhotos()
        
        viewModel.changeHandler = { change in
            switch change {
            case .didFetchRecent:
                self.tableView.reloadData()
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

// MARK: - UITableViewDelegate
extension RecentViewController: UITableViewDelegate {
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = SearchViewController(viewModel: RecentViewModel())
        navigationController?.pushViewController(viewController, animated: true)
    }*/
    
}

// MARK: - UITableViewDataSource
extension RecentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentTableViewCell
        guard let recent = viewModel.photoForIndexPath(indexPath) else {
            fatalError("Photo not found")
        }
        cell.userName = recent.ownername
        cell.photoImageView.kf.setImage(with: recent.iconUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
}
