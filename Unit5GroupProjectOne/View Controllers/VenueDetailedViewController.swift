//
//  VenueDetailedViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

//Message by Melissa: This is the view controller that displays the detailed view

class VenueDetailedViewController: UIViewController {

    let detailView = VenueDetailedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        detailView.createTableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(AddButtonPressed))
    }
    
    @objc private func AddButtonPressed() {
        navigationController?.present(AddCollectionTipViewController(), animated: true, completion: nil)
    }
    
    private func constrainView() {
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { (view) in
            view.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
}
extension VenueDetailedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: add array count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VenueDetailedTableViewCell
        //TODO: configure cell and array object
        return cell
    }
    
    
}
