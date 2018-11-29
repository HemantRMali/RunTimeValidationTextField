//
//  StringExtension.swift
import UIKit

///
extension String {
    /// Trim string from left and right.
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    ///
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    /// This function check the phonenumber is Valid or Not.
    ///
    /// - Returns: return boolean value number is valid or not
    var isValidContact: Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
    
    // MARK: Validation Methods
    /// Validate email string.
    ///
    /// - Parameter email: email.
    /// - Returns: (true/false).
    func validateEmail(email: String) -> Bool {
        //guard !email.isEmpty else { return false }
        let emailRegEx = "[.0-9a-zA-Z_-]+@[0-9a-zA-Z.-]+\\.[a-zA-Z]{2,20}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: email) { return false }
        return true
    }
    
    /// This function is use to check string contains special characters or not.
    ///
    /// - Returns: Boolean value
    func hasSpecialCharacters() -> Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
            
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        
        return false
    }
}
