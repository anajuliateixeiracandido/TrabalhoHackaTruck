//
//  MapVieew.swift
//  CoreLocationSearchBar
//
//  Created by Maxim Macari on 3/1/21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @State var locais: [Local]
    @EnvironmentObject var mapData: MapViewModel
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let view = mapData.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        for local in locais {
            let annotation = MyAnnotation(coordinate: local.coordenada,
                                          title: local.descricao,
                                          subtitle: "Ocorrência")
            view.addAnnotation(annotation)
            
            
            print(local)
        }
        
        
        return view
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            //Custom pins
//
//
//            //excluding user blue circlee
//            if annotation.isKind(of: MKUserLocation.self) {
//                return nil
//            } else {
//                let pinAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
//                pinAnnotation.tintColor = .red
//                //pinAnnotation.animatesDrop = true
//                pinAnnotation.canShowCallout = true
//
//                return pinAnnotation
//            }
//        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

               if let userLocation = annotation as? MKUserLocation {

                   let view = (mapView.dequeueReusableAnnotationView(withIdentifier: "userLocationPin") as? MKPinAnnotationView) ?? MKPinAnnotationView(annotation: userLocation, reuseIdentifier: "userLocationPin")

                   view.pinTintColor = .purple

                   view.canShowCallout = true

                   return view
               }

               if let pin = annotation as? MKPointAnnotation {

                   let view = (mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKPinAnnotationView) ?? MKPinAnnotationView(annotation: pin, reuseIdentifier: "pin")

                   view.pinTintColor = .red

                   view.canShowCallout = true

                   return view
               }

               return nil
           }
        
        func mapViewAnnotation(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            //Custom pins
            if annotation is MyAnnotation{
                let identifier = "MyAnnotationIdentifier"
                
                var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                if annotationView == nil {
                    annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                    annotationView?.image = UIImage(systemName: "house")
                    annotationView?.canShowCallout = true
                } else {
                    annotationView?.annotation = annotation
                }
                
                return annotationView
            }
            
            return nil
            
        }
    }
}


