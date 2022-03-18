//
//  AddViewController.swift
//  MyReminders
//
//  Created by Никита Коголенок on 18.03.22.
//

import UIKit

class AddViewController: UIViewController {
    
    // MARK: - Variable
    public var completion: ((String, String, Date) -> Void)?
    
    // MARK: - Outlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDelegateAndNavigation()
    }
    
    func createDelegateAndNavigation() {
        titleTextField.delegate = self
        bodyTextField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }
    
    // MARK: - Action
    @objc func didTapSaveButton() {
            if let titleText = titleTextField.text, !titleText.isEmpty,
                let bodyText = bodyTextField.text, !bodyText.isEmpty {

                let targetDate = datePicker.date

                completion?(titleText, bodyText, targetDate)
            }
        }
}
