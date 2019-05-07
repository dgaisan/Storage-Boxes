//
//  LocationsController.swift
//  Storage-Boxes
//

import UIKit

class LocationsController: UICollectionViewController {
    
    var locations = [Location]()
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        print("-----LocationsController->viewDidLoad")
        loadLocations()
    }
    
    func loadLocations () {
        print("++++++++load locations")

        locations.removeAll()
        locations.append(contentsOf: LocalDataManager.loadAll(Location.self))
        print(locations)
        print(locations.count)
        self.collectionView.dataSource = self
        print("End loading locations ----------")
    }

    @IBAction func addNewLocation (_ sender: UIBarButtonItem) {
        
//        let addEditLocationController = self.storyboard!.instantiateViewController(withIdentifier: "AddEditLocation") as! AddEditLocationController
//        addEditLocationController.locationSetter = self
//        addEditLocationController.locationName = "Hi Bro"
//        self.show(addEditLocationController, sender: self)
        
        editLocation(nil)
    }
    
    func editLocation (_ location: Location?) {
        let addEditLocationController = self.storyboard!.instantiateViewController(withIdentifier: "AddEditLocation") as! AddEditLocationController
        
        addEditLocationController.locationSetter = self
        if location != nil {
            addEditLocationController.location = location
        }
        
        self.show(addEditLocationController, sender: self)
    }
}

extension LocationsController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let locationCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCell
        
        locationCell.setData(locations[indexPath.row])
        locationCell.cellEditTrigger = self
        locationCell.layer.cornerRadius = view.frame.size.width / 20
        locationCell.clipsToBounds = true
        locationCell.layer.borderWidth = 1
        locationCell.layer.borderColor = UIColor.white.cgColor
        
        return locationCell
    }
}

extension LocationsController: LocationSetterProtocol {
    func setLocation(_ location: Location) {
        location.save()
        loadLocations()
        self.collectionView.reloadData()
    }
}

extension LocationsController: TriggerCellEdit {
    func onCellEdit(_ location: Location) {
        editLocation(location)
    }
    
    
}
