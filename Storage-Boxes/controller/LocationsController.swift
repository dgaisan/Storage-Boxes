//
//  LocationsController.swift
//  Storage-Boxes
//

import UIKit

class LocationsController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNewLocation(_ sender: UIBarButtonItem) {
        let addEditLocationController = self.storyboard!.instantiateViewController(withIdentifier: "AddEditLocation") as! AddEditLocationController
        self.show(addEditLocationController, sender: self)
    }
    
}
