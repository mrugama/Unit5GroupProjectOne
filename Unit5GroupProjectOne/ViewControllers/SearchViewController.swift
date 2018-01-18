//
//  ViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/16/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    var someView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        someView.backgroundColor = .red
        view.addSubview(someView)
        someView.snp.makeConstraints { (view) in
            let safe = self.view.safeAreaLayoutGuide
            view.top.bottom.leading.trailing.equalTo(safe)
//            view.width.height.equalTo(200)
//            view.center.equalToSuperview()
        }
    }



}

