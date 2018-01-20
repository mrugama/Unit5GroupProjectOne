//
//  SearchViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class SearchViewController: UIViewController {
    
    let someView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        
    }
    
    private func constrainView() {
        view.addSubview(someView)
        someView.backgroundColor = .cyan
        someView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    

}
