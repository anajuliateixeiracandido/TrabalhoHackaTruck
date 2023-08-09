//
//  Place.swift
//  Xisnovee
//
//  Created by Student18 on 14/06/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var placemark: CLPlacemark
}

