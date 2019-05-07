//
//  ColorPickerDropdown.swift
//  Storage-Boxes
//

import UIKit

class ColorPickerDropdown: UIPickerView {
    
    var supportedColors: [UIColor]!
    
    let customHeight: CGFloat = 30
    let customWidth: CGFloat = 30
}

extension ColorPickerDropdown: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return supportedColors.count
    }
}

extension ColorPickerDropdown: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        view.backgroundColor = supportedColors[ row]
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        
        return view
    }
}
