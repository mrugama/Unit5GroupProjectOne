//
//  AddCollectionTipView.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

//Message by Melissa: this is the view that the users will see after tapping the "+" bar button item in the venue detail view to add the venue to their collections or create a new collection with that venue
    //could also be what they see if they're in the collections tab; in the venue detail view, instead of seeing the "+" sign, they should see the "edit" sign so they can edit their tips!

class AddCollectionTipView: UIView {
    
    //to do:
        //should have a collection view at the bottom, and some stuff at the top
        //should have a textfield at the top which takes in the collection name
        //should have a "leave a tip" label
        //and below it should be a text view that lets you write/edit tips
        //create properties and initializers
    
        //maybe name the collection view the bottom view?
    lazy var venueTipCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let venueTipCv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        venueTipCv.backgroundColor = .white
        venueTipCv.register(VenueCollectionViewCell.self, forCellWithReuseIdentifier: "AddCollectionTipCell")// not sure if we can use the same cell as venue collection??
        return venueTipCv
    }()
    
    lazy var venueTipTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a name for your collection"
        tf.autocorrectionType = .no
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOpacity = 1
        tf.layer.shadowOffset = CGSize.zero
        tf.layer.shadowRadius = 10
        return tf
    }()
    
    lazy var venueTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Please leave a tip"
        label.textAlignment = .center
        return label
    }()
    lazy var venueTipTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let viewObject = [venueTipCollectionView, venueTipTextField, venueTipLabel, venueTipTextView] as [UIView]
        viewObject.forEach{addSubview($0)}
        
        venueTipTextField.snp.makeConstraints { (field) in
            field.top.leading.equalTo(self).offset(5)
            field.trailing.equalTo(self).offset(-5)
            field.height.equalTo(50)
        }
        venueTipLabel.snp.makeConstraints { (label) in
            label.width.equalTo(self.venueTipTextField)
            label.top.equalTo(self.venueTipTextField.snp.bottom)
        }
        venueTipTextView.snp.makeConstraints { (view) in
            view.width.equalTo(self.venueTipTextField)
            view.top.equalTo(self.venueTipLabel.snp.bottom)
            
        }
        venueTipCollectionView.snp.makeConstraints { (collection) in
            collection.width.equalTo(self.venueTipTextField)
            collection.top.equalTo(self.venueTipTextView.snp.bottom)
        }
        
    }
    
    
    // MARK:- ---> Textfield Delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
    
}
