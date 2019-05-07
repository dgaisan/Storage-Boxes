//
//  LocationCell.swift
//  Storage-Boxes
//

import UIKit

protocol TriggerCellEdit {
    func onCellEdit(_ location: Location)
}

class LocationCell: UICollectionViewCell {
    
    @IBOutlet weak var locationNameLabel: UILabel!
    
    var location: Location?
    var cellEditTrigger: TriggerCellEdit?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData (_ location: Location) {
        print("+++++ Location Cell setting Data")
        print(location)
        self.location = location
        self.locationNameLabel?.text = location.name
    }
    
    @IBAction func editLocation () {
        print("++++LocationCell Editing Location")
        if let ce = cellEditTrigger {
            ce.onCellEdit(self.location!)
        }
    }
    
}
