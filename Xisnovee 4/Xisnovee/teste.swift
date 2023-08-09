import SwiftUI
import MapKit
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Lógica para manipular as atualizações de localização aqui
    }
}

struct Teste: View {
    @State private var userLocation: CLLocationCoordinate2D?
    private let locationManager = CLLocationManager()
    private let locationDelegate = LocationDelegate()

    var body: some View {
        VStack {
            if let location = userLocation {
                MapView(centerCoordinate: location)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Text("Localização indisponível")
            }
        }
        .onAppear {
            locationManager.delegate = locationDelegate
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

struct MapView: UIViewRepresentable {
    var centerCoordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}
