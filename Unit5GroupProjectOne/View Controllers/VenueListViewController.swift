//
//  VenueListViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

//Message by Melissa: for the table view results that the user can also see when searching for venues

class VenueListViewController: UIViewController {

    //TODO: get images
    
        //no need for self-sizing cells, so please give a specific height for each row
        //set up delegate methods
        //in the did select delegate method, tapping a table view cell should segue to a
    lazy var venueListTableView: UITableView = {
        let tv = UITableView()
        tv.register(VenueTableViewCell.self, forCellReuseIdentifier: "VenueListCell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constrainTableView()
        venueListTableView.dataSource = self
        venueListTableView.delegate = self
        configureNavigation()
        venueListTableView.rowHeight = 97.5
        
    }
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func constrainTableView() {
        view.addSubview(venueListTableView)
        venueListTableView.snp.makeConstraints { (view) in
            view.top.bottom.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func configureNavigation() {
        //Melissa: if this view controller is already embedded in a navigation controller, this is not needed, we can just push the venue detailed view on to the navigation stack
//        let venueNavigation = UINavigationController(rootViewController: VenueDetailedViewController())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
        navigationItem.title = "Search Results"
    }
    
}
extension VenueListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueListCell", for: indexPath)
        //TODO: configure cell with data
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = VenueDetailedViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        //TODO: setup segue to detailVC
    }
}

