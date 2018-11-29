//
//  ColorExtension.swift


import UIKit

// MARK: - UIColor extension
extension UIColor {

    ///
    static var textColor: UIColor {
        return UIColor.black
    }
    
    ///
    static var errorSeparatorColor: UIColor {
        return UIColor.red
    }
    
    ///
    static var activeSeparatorColor: UIColor {
        //return UIColor.init(red: 23/255.0, green: 56.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        return UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    ///
    static var separatorColor: UIColor {
        return UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    ///
    static var floatingLabelTextColor: UIColor {
        return UIColor.init(red: 23.0/255.0, green: 56.0/255.0, blue: 131.0/255.0, alpha: 1.0)
    }
    
    ///
    static var placeHolderColor: UIColor {
        return UIColor.init(red: 144.0/255.0, green: 144.0/255.0, blue: 144.0/255.0, alpha: 1.0)
    }
}
