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
    var previousVC: VenueDetailedViewController!
    
    init(venue: Venue, VC: VenueDetailedViewController) {
        super.init(nibName: nil, bundle: nil)
        self.venue = venue
        self.previousVC = VC
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCollection))
        backHomeButton()
    }
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveCollection() {
        guard let text = addTipView.venueTipTextField.text else {return}
    }
    
    private func backHomeButton() {
        addTipView.homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
    }
    
    @objc private func homeButtonPressed() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 4, options: [], animations: {
            
            self.addTipView.homeButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) }, completion: { finished in
                UIView.animate(withDuration: 0.06, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 4, options: .curveEaseIn, animations: { self.addTipView.homeButton.transform = CGAffineTransform(scaleX: 1, y: 1) }, completion: { (_) in
                    self.dismissView()
//                    self.navigationController?.popToRootViewController(animated: true)
                    self.navigationController?.popToViewController(SearchViewController(), animated: true)
                    self.previousVC.navigationController?.dismiss(animated: true, completion: nil)
                } )})
        
    }
    
    private func constrainView() {
        view.addSubview(addTipView)
        
        addTipView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
