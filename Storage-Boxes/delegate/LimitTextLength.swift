//
//  LimitTextLength.swift
//  Storage-Boxes
//

import UIKit

class LimitTextLength: NSObject, UITextFieldDelegate {
    
    var lengthLimit: Int
    
    init(limitTo limit: Int) {
        self.lengthLimit = limit
    }
    
    func textField (_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        return newText.length <= self.lengthLimit
    }
}
