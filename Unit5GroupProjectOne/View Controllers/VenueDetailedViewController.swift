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
    var venueDetail = [String]() {
        didSet {
            self.detailView.VenueDetailTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        detailView.VenueDetailTableView.dataSource = self
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! VenueDetailedTableViewCell
        //TODO: configure cell and array object
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? VenueDetailedTableViewCell {
//            let venue = venueDetail[indexPath.row]
//            cell.venueImage.image = nil
//            if indexPath.row == 0 {
//                if let urlImage = URL(string: venue) {
//                    cell.venueImage.kf.indicatorType = .activity
//                    cell.venueImage.kf.setImage(with: urlImage, placeholder: UIImage.init(named: "defaultImage"), options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
//                        cell.detailDescriptionLabel.text = nil
//                    })
//
//                }
//            } else {
//                cell.detailDescriptionLabel.text = venue
//            }
//            return cell
//        }
        return cell
        //return UITableViewCell()
    }
    
    
}
