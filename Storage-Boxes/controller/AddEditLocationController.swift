//
//  AddEditLocationController.swift
//  Storage-Boxes
//

import UIKit

protocol LocationSetterProtocol {
    func setLocation (_ location: Location)
}

class AddEditLocationController: UIViewController {
    
    typealias SaveCB = (_ data: Location) -> ()
    
    var locationName: String?
    
    public var location: Location!
    public var locationColor: String!
    public var locationSetter: LocationSetterProtocol!
    
    private var textLimitDelegate: UITextFieldDelegate!
    private var colorPicker: ColorPickerDropdown!
    private let colorPickerData = [
        UIColor.black, UIColor.red,
        UIColor.gray, UIColor.green,
        UIColor.cyan, UIColor.darkGray,
        UIColor.yellow, UIColor.white
    ]
    
    @IBOutlet weak var locationNameView: UITextField!
    @IBOutlet weak var locationColorView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("+++ AddEditLocationController viewDidLoad")
        self.initControls()
        self.populateEditValues()
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func saveChanges (_ sender: UIBarButtonItem) {
        print("+++ saveChanges +++")
        if let lsetter = locationSetter {
            //lsetter.setLocation(Location(id: UUID(), name: locationNameView.text!, createdAt: Date()))
            lsetter.setLocation(Location(id: UUID(), name: locationNameView.text!))
        }

        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func deleteLocation(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func discardChanges (_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func initControls () {
        textLimitDelegate = LimitTextLength(limitTo: 15)
        locationNameView.delegate = textLimitDelegate
        
        colorPicker = ColorPickerDropdown()
        colorPicker.supportedColors = colorPickerData
        locationColorView.delegate = colorPicker
        locationColorView.dataSource = colorPicker
    }
    
    private func populateEditValues () {
        print("+++++populateEditValues+++++")
        if let n = self.locationName {
            print("locationName = \(n)")
            self.locationNameView.text = n
        } else {
            print("LocationName was not supplied")
        }
        if let hexColor = self.locationColor {
            if let row = colorPickerData.firstIndex(of: UIColor(hex: hexColor)!) {
                self.locationColorView.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }
}

