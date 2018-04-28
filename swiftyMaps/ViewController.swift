//
//  ViewController.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import UIKit
import MapKit
import MBProgressHUD
import ObjectMapper


class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var rootClass: RootClass?
    private var isLoadingData = false
    public var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //location permission
        checkLocationAuthorizationStatus()
        //call API to get data
        getPSIData()
    }

    @IBAction func refreshBtn(_ sender: Any) {
        self.annotations.removeAll()
        self.getPSIData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManager
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }

    
    func setDataOnMap(psi: MapPSIData) {
        let location = CLLocationCoordinate2DMake(psi.lat, psi.lng)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        if(psi.name == "west"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.west)!)";
        }else if (psi.name == "national"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.national)!)"
        }else if(psi.name == "east"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.east)!)"
        }else if(psi.name == "central"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.central)!)"
        }else if(psi.name == "south"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.south)!)"
        }else if(psi.name == "north"){
            annotation.title = "\(psi.name) PSI 24hr: \((psi.psi?.pm10TwentyFourHourly?.north)!)"
        }
        
        self.annotations.append(annotation)
        self.addAnnotationToMap()
        
    }
    
    func addAnnotationToMap() {
        for annotation in self.annotations {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    //method to fetch the PSI from the server
    func getPSIData(){
        if(isLoadingData) {
            return
        }
        isLoadingData = true
        let hub = MBProgressHUD.showAdded(to: self.view, animated: true)
        hub.mode = MBProgressHUDMode.indeterminate
        hub.label.text = NSLocalizedString("Loading", comment: "")
        
        UserServices.getPSIAPI(completion:{ [weak self] (result) in
            print("result is >>>>\(result.result.value)")
            if let strongSelf = self {
                if result.result.isSuccess {
                    if result.response??.statusCode == 200 {
                        if let obj = Mapper<RootClass>().map(JSONObject: result.result.value) {
                            strongSelf.rootClass = obj
                            
                            //var psiLatLong = [] as [LabelLocation]
                            
                            var psiLatLong:[MapPSIData] = []
                            
                            for mapData in (obj.regionMetadata)! {
                                let psiReading = MapPSIData(name: mapData.name!, lat: (mapData.labelLocation?.latitude)!, lng: (mapData.labelLocation?.longitude)!, psi: (strongSelf.rootClass?.items![0].readings)!)
                                strongSelf.setDataOnMap(psi: psiReading)
                            }
                        }
                        strongSelf.dismiss(animated: true, completion: nil)
                        
                    }
                }
                hub.hide(animated: true)
                strongSelf.isLoadingData = false
            }
        })
    }
}

