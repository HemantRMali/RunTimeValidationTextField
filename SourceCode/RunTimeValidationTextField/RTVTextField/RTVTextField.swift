//
//  RTVTextField.swift
//  RunTimeValidationTextField
//
//  Created by Hemant on 11/28/18.
//  Copyright © 2018 Hemant. All rights reserved.
//
import UIKit
import Cartography
import JVFloatLabeledTextField

/// RTVTextFieldDelegate
protocol RTVTextFieldDelegate: class {
    // MARK: - RTVTextFieldDelegate
    ///
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    ///
    func textFieldDidEndEditing(_ textField: UITextField)
    ///
    func textFieldDidBeginEditing(_ textField: UITextField)
}
    
///
extension RTVTextFieldDelegate {
    // MARK: - RTVTextFieldDelegate
    /// textField
    ///
    /// - Parameters:
    ///   - textField: textField
    ///   - range: shouldChangeCharactersIn
    ///   - string: replacementString
    /// - Returns: Bool
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    /// textFieldDidEndEditing
    ///
    /// - Parameter textField: textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let txtField = textField as? RTVTextfield {
            txtField.separatorLabel.backgroundColor = .separatorColor
        }
    }
    
    /// textFieldDidBeginEditing
    ///
    /// - Parameter textField: textField
    func textFieldDidBeginEditing(_ textField: UITextField) { }
}

/// Custiomizied JVFloatLabeledTextField
class RTVTextfield: JVFloatLabeledTextField {
    // MARK: - Variable
    ///
    weak var rtvDelegate: RTVTextFieldDelegate?
    ///
    let separatorLabel = UILabel()
    ///
    let validationLabel = UILabel()
    
    var showValidations = false
    
    ///
   @IBInspectable var isValidationsEnable: Bool = false {
        didSet {
           showValidations = isValidationsEnable
        }
    }
    
    ///
    @IBInspectable var customtextColor: UIColor = .textColor {
        didSet {
            self.textColor = customtextColor
        }
    }
    
    ///
    @IBInspectable var validationText: String = "" {
        didSet {
            self.validationLabel.text = validationText
        }
    }
    
    ///
    @IBInspectable var activeSeparatorColor: UIColor = .activeSeparatorColor {
        didSet {
            separatorLabel.backgroundColor = activeSeparatorColor
        }
    }
    
    @IBInspectable var rtvFloatingLabelTextColor: UIColor = .black {
        didSet {
            self.floatingLabelTextColor = rtvFloatingLabelTextColor
        }
    }
    
    @IBInspectable var rtvFloatingLabelActiveColor: UIColor = .black {
        didSet {
            self.floatingLabelActiveTextColor = rtvFloatingLabelActiveColor
        }
    }
    
    
    ///
    @IBInspectable var validationColor: UIColor = UIColor.red {
        didSet {
            self.validationLabel.textColor = validationColor
        }
    }
    
    // MARK: - setup view
    ///
    override func awakeFromNib() {
        super.awakeFromNib()
        // Add bottom line if needed.
            //isSeparatorEnable = false
            //isValidationsEnable = false
            addLeftPadding()
            setPlaceholderColor()
            setupUI()
        
        delegate = self
        textColor = customtextColor
        backgroundColor = .white
        
        guard isValidationsEnable else { self.borderStyle = .roundedRect; return }
        separatorLabel.backgroundColor = .separatorColor
        addSubview(separatorLabel)
        constrain(separatorLabel) { view in
            guard let superView = view.superview else { return } // change
            view.height == 3.0
            view.leading == superView.leading
            view.trailing == superView.trailing
            view.bottom == superView.bottom
        }
        
        guard isValidationsEnable else { self.borderStyle = .roundedRect; return }
        validationLabel.textColor = validationColor
        validationLabel.text = self.validationText
        validationLabel.font = validationLabel.font.withSize(15)
        addSubview(validationLabel)
        constrain(validationLabel){ view in
            guard let superView = view.superview else { return }
            //view.height == 10
            view.leading == superView.leading
            view.trailing == superView.trailing
            view.bottom == superView.bottom + 20
        }
    }
    
    /// intrinsicContentSize
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 45.0)
    }
    
    // MARK: - Textfield Binding
    ///
    var textChanged: (String) -> Void = { _ in }
    
    ///
    func bind(callback: @escaping (String) -> Void) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    ///
    func setupUI() {
        backgroundColor = UIColor.clear
        textColor = customtextColor
        
        /* JVFloatLabeledTextField */
        floatingLabelTextColor = UIColor.floatingLabelTextColor
        floatingLabelActiveTextColor = UIColor.floatingLabelTextColor
        floatingLabelYPadding = 5.0
    }
    
    ///
    func setPlaceholderColor() {
        self.placeHolderColorRTV = UIColor.placeHolderColor
    }
    
    ///
    func setCornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
    }
    
    ///
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return } // change
        self.textChanged(text)
    }
    
    ///
    func showValidationError(_ validationText: String) {
        
        guard isValidationsEnable else  { return }
        activeSeparatorColor = validationColor
        self.validationText = validationText
        floatingLabelActiveTextColor = validationColor
        floatingLabelTextColor = validationColor
        validationLabel.textColor = validationColor
    }
    
    ///
    func removeValidationError() {
        guard isValidationsEnable else { return }
        activeSeparatorColor = .activeSeparatorColor
        validationText = ""
        floatingLabelActiveTextColor = .black
        floatingLabelTextColor = .black
        validationLabel.textColor = .clear
    }
}

// MARK: - <#UITextFieldDelegate#>
extension RTVTextfield: UITextFieldDelegate {
    // MARK: - RTVTextField Delegate
    /// textFieldDidBeginEditing
    ///
    /// - Parameter textField: textField
    func textFieldDidBeginEditing(_ textField: UITextField) {
         if let strongDelegate = rtvDelegate {
            return strongDelegate.textFieldDidBeginEditing(textField)
        }
    }
    
    /// textFieldDidEndEditing
    ///
    /// - Parameter textField: textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let strongDelegate = rtvDelegate {
            return strongDelegate.textFieldDidEndEditing(textField)
        }
    }
    
    /// textFieldShouldReturn
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    /// textField
    ///
    /// - Parameters:
    ///   - textField: textField
    ///   - range: shouldChangeCharactersIn
    ///   - string: replacementString
    /// - Returns: Bool
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let strongDelegate = rtvDelegate {
            return strongDelegate.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
}
