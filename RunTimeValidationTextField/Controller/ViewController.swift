//
//  ViewController.swift
//  RunTimeValidationTextField
//
//  Created by Hemant on 11/28/18.
//  Copyright © 2018 Hemant. All rights reserved.
//

import UIKit

///
class ViewController: UIViewController {
    
    // MARK: - Variables
    ///
    @IBOutlet weak var firstNameTextfield: RTVTextfield!
    ///
    @IBOutlet weak var lastNameTextfield: RTVTextfield!
    ///
    @IBOutlet weak var emailTextfield: RTVTextfield!
    ///
    @IBOutlet weak var phoneNumberTextfield: RTVTextfield!
    
    // MARK: - LifeCycle Methods
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        lastNameTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        emailTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        phoneNumberTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // This will notify us when something has changed on the textfield
    @objc func textFieldDidChange(_ textfield: RTVTextfield) {
        if let _ = textfield.text {
            validate(textfield, textfield.tag)
        }
    }
    
    // MARK: - IBAction
    @IBAction func actionSubmit(_ sender: UIButton) {
        checkEmptyFields()
    }
    
    // MARK: - Helper Methods
    ///
    func checkEmptyFields() {
        let whitespaceSet = CharacterSet.whitespaces
        if let firstName = firstNameTextfield.text, firstName.trimmingCharacters(in: whitespaceSet).isEmpty {
            firstNameTextfield.showValidationError("First name is empty")
        } else if let lastName = lastNameTextfield.text, lastName.trimmingCharacters(in: whitespaceSet).isEmpty {
            lastNameTextfield.showValidationError("Last name is empty")
        } else if let email = emailTextfield.text, email.trimmingCharacters(in: whitespaceSet).isEmpty {
            emailTextfield.showValidationError("Email is empty")
        } else if phoneNumberTextfield.text?.count == 0 {
            phoneNumberTextfield.showValidationError("Phone number is empty")
        }
    }
    
    /// Check validation for SignUp screen.
    func validate(_ textField: RTVTextfield, _ textFieldTag: Int) {
        switch textFieldTag {
        case 0, 1:
            if textField.text?.hasSpecialCharacters() ?? false {
                //print("Speicla character found")
                textField.showValidationError(textFieldTag == 0 ? "Enter valid first name" : "Enter valid last name")
            } else {
                textField.removeValidationError()
            }
            break
        case 2:
            if let email = textField.text, email.count > 0, !email.validateEmail(email: email) {
                //print("Invalid email")
                textField.showValidationError("Invalid email")
            } else {
                textField.removeValidationError()
            }
            break
        case 3:
            if let pNumber = textField.text, pNumber.count > 0, !pNumber.isValidContact {
                textField.showValidationError("Invalid mobile number")
            } else {
                textField.removeValidationError()
            }
            break
        default:
            print("default")
        }
        
    }
}


