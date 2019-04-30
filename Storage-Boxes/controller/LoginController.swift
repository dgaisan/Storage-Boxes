//
//  LoginController.swift
//  Storage-Boxes
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPassTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var authType: AuthenticationType!
    
    override func viewDidLoad () {
        super.viewDidLoad()
        self.initControls()
        
    }
    
    @IBAction
    func handleLoginAction () {
        self.displayWorkInProgressAlert()
    }
    
    @IBAction
    func handleAuthTypeChanged () {
        var label: String

        if authType == .SignIn {
            authType = .SignUp
            label = sharedLabels.SIGN_UP
        } else {
            authType = .SignIn
            label = sharedLabels.SIGN_IN
        }
        
        loginButton.setTitle(label, for: .normal)
    }
    
    private func initControls () {
        authType = .SignIn
        
        // Setting Placeholder Text Color for Username textfield
        userNameTextField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        // Setting Placeholder Text Color for Password textfield
        userPassTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    
    private func displayWorkInProgressAlert() {
        let alert = UIAlertController(title: "Alert", message: "This feature is still in progress...", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }

}

