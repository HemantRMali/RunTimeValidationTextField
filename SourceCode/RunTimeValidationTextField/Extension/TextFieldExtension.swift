//
//  TextFieldExtension.swift

import UIKit

///
extension UITextField {
    
    /// Place holder color.
    @IBInspectable var placeHolderColorRTV: UIColor? {
        get {
            return self.placeHolderColorRTV
        }
        set {
            guard let ph = placeholder else {
                return
            }
            self.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor: newValue ?? .lightGray]) // change
        }
    }
    
    ///
    func addLeftPadding() {
        self.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: self.frame.height))
        self.leftViewMode = .always
    }
    
}
