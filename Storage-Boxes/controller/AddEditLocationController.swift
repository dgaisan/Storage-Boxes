//
//  AddEditLocationController.swift
//  Storage-Boxes
//

import UIKit

class AddEditLocationController: UIViewController {
    
    var name: String!
    var color: UIColor!
    var textLimitDelegate: UITextFieldDelegate!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var colorInput: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initControls()
    }
    
    private func initControls () {
        textLimitDelegate = LimitTextLength(limitTo: 15)
        nameInput.delegate = textLimitDelegate
        
        if let n = self.name {
            self.nameInput.text = n
        }
        if let c = self.color {
            // TODO
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

