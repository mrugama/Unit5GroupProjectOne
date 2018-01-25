//
//  AddCollectionTipViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AddCollectionTipViewController: UIViewController {
    
    let addTipView = AddCollectionTipView()
    let venue: VenueTipModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveCollection))
    }
    @objc private func saveCollection() {
        guard let text = addTipView.venueTipTextField.text else {return}
        FileManagerHelper.manager.addNewCollection([venue], withCollectionName: text)
    }
    
    private func constrainView() {
        view.addSubview(addTipView)
        
        addTipView.snp.makeConstraints { (view) in
            view.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
