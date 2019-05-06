//
//  AddEditLocationController.swift
//  Storage-Boxes
//

import UIKit

class AddEditLocationController: UIViewController {
    
    var locationName: String!
    var locationColor: UIColor!
    var textLimitDelegate: UITextFieldDelegate!
    var colorPicker: ColorPickerDropdown!
    
    @IBOutlet weak var locationNameView: UITextField!
    @IBOutlet weak var locationColorView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initControls()
        self.populateEditValues()
    }
    
    
    private func initControls () {
        textLimitDelegate = LimitTextLength(limitTo: 15)
        locationNameView.delegate = textLimitDelegate
        
        colorPicker = ColorPickerDropdown()
        locationColorView.delegate = colorPicker
        locationColorView.dataSource = colorPicker
        
    }
    
    private func populateEditValues () {
        if let n = self.locationName {
            self.locationNameView.text = n
        }
        if let c = self.locationColor {
            //self.locationColorView.set = c
        }
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func discardChanges (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

