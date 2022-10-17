//
//  RecentViewController.swift
//  Flickr
//
//  Created by SEVVAL on 14.10.2022.
//

import UIKit

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
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    
    
}

// MARK: - UITableViewDataSource
extension RecentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosResponse?.photos?.photo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell - \(indexPath.row)"
        return cell
    }
    
}
