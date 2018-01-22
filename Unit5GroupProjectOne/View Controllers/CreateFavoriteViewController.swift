//
//  CreateFavoriteViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CreateFavoriteViewController: UIViewController {

    lazy var favoriteTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a name for your collection"
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOpacity = 1
        tf.layer.shadowOffset = CGSize.zero
        tf.layer.shadowRadius = 10
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTextField.delegate = self
        constraints()
        navigationItem.title = "Create Collection"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCollection))
    }
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func saveCollection() {
        //TODO: Save textField text in filemanager
    }
    
    private func constraints() {
        view.addSubview(favoriteTextField)
        favoriteTextField.snp.makeConstraints { (textField) in
            textField.top.leading.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            textField.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-5)
            textField.height.equalTo(50)
        }
    }

}
extension CreateFavoriteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
