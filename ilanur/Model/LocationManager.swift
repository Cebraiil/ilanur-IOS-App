//
//  LocationManager.swift
//  ilanur
//
//  by Developer Light on 1.07.2022.
//

import Foundation
import CoreLocation
import MapKit
import Contacts
import Adhan

class LocationManager: NSObject, ObservableObject {
    
    let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
    
    
    func prayerTimes() -> PrayerTimes? {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude: manager.location?.coordinate.latitude ?? 0,longitude: manager.location?.coordinate.longitude ?? 0)
        var params = CalculationMethod.turkey.params
        params.madhab = .shafi

        return PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params)
    }
    
    func nextPrayer() -> Date? {
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let date = cal.dateComponents([.year, .month, .day], from: Date())
        let coordinates = Coordinates(latitude: manager.location?.coordinate.latitude ?? 0,longitude: manager.location?.coordinate.longitude ?? 0)
        var params = CalculationMethod.turkey.params
        params.madhab = .shafi
        let prayerTimes = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params)

        let next = prayerTimes!.nextPrayer()
        if next != nil {
            let countdown = prayerTimes?.time(for: next!)
            return countdown

        } else {
            let countdown = Date.now
            return countdown
        }
    }
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}


extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("")
        case .restricted:
            print("")
        case .denied:
            print("")
        case .authorizedAlways:
            print("")
        case .authorizedWhenInUse:
            print("")
        case .authorized:
            print("")
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
