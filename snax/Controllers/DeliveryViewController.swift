//
//  DeliveryViewController.swift
//  snax
//
//  Created by Jessica Yuan on 4/25/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit
import GoogleMaps

class DeliveryViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Delivery"
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 42.4534, longitude: -76.4735, zoom: 14.4)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 42.4534, longitude: -76.4735)
        marker.title = "Cornell"
        marker.snippet = "Ithaca"
        marker.map = mapView
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
