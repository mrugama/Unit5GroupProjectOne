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
    var venue: Venue!
    
    init(venue: Venue) {
        super.init(nibName: nil, bundle: nil)
        self.venue = venue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCollection))
    }
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveCollection() {
        guard let text = addTipView.venueTipTextField.text else {return}
        
    }
    
    private func constrainView() {
        view.addSubview(addTipView)
        
        addTipView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
