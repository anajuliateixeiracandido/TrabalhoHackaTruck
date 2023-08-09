//
//  NewMapView.swift
//  Xisnovee
//
//  Created by Student18 on 15/06/23.
//

import SwiftUI
import _MapKit_SwiftUI

struct NewMapView: View {
    @State var listaTipos: TipoVM = TipoVM()
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -19.9227, longitude: -43.9452),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    
    //@StateObject var listaTipos: TipoVM
    //@State var locais: [Local]
    
    @StateObject var listaOcorrencias: OcorrenciaVM
    @State private var showingSheet = false
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: listaOcorrencias.listaLocal){item in
            MapAnnotation(coordinate: item.coordenada){
                ZStack{
                    Image(systemName: getIcone(local: item, listaTipos: listaTipos))
                        .foregroundStyle(.black)
                        .imageScale(.large)
                        .font(.system(size: 25))
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 5))
                    
                    Button("."){
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet){
                        Credibilidade(ocorrencia: getIcone(local: item, listaOcorrencias: listaOcorrencias))
                    }
//                    Circle().fill(.black).frame(width: 10, height: 10)
                }
            }
            
        }.onAppear(){
            print(listaOcorrencias.lista.count)
            print(listaOcorrencias.listaLocal.count)
        }
    }
}

func getIcone(local: Local, listaTipos: TipoVM) -> String{
    listaTipos.fetch()
    let filteredTipos = listaTipos.tipos.filter{$0.descricao ==  local.descricao}
    if let tipo = filteredTipos.first {
            return tipo.icone
        } else {
            // Caso não seja encontrado nenhum tipo com a descrição correspondente
            return "Ícone padrão"
        }
}

func getIcone(local: Local, listaOcorrencias: OcorrenciaVM) -> Ocorrencia{
    let filteredTipos = listaOcorrencias.lista.filter{$0.latitude ==  local.coordenada.latitude}
    if let ocorrencia = filteredTipos.first {
            return ocorrencia
        }
    return Ocorrencia(_id: "", _rev: "", latitude: 0, longitude: 0, tipo: "", credibilidade: 0)
}

//struct NewMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMapView()
//    }
//}
