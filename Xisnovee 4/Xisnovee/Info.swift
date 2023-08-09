//
//  XisnoveeApp.swift
//  Xisnovee
//
//  Created by Student13 on 07/06/23.
//

import Foundation
import MapKit

struct Location : Identifiable{
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var flag: String
    var description: String
}
