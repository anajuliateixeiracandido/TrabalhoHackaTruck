//
//  MainTeste.swift
//  Xisnovee
//
//  Created by Student18 on 13/06/23.
//

import SwiftUI

struct Main: View {
    @StateObject var listaTipos = TipoVM()
    @StateObject var listaOcorrencias = OcorrenciaVM()
    @State var locais: [Local] = []
    
    
    var body: some View {
        TabView{
            NewMapView(listaOcorrencias: listaOcorrencias)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
//            
//            Home(listaTipos: listaTipos, locais: listaOcorrencias.listaLocal)
//                .tabItem{
//                    Label("Home", systemImage: "house")
//                }
            TelaRegistro(listaTipos: listaTipos, listaOcorrencias: listaOcorrencias)
                .tabItem{
                    Label("Ocorrencias", systemImage: "list.bullet")
                }
        }.onAppear{
            listaTipos.fetch()
            
//            print("--Lista tipos--")
//            for x in listaTipos.tipos{
//                print(x.descricao,"aaaa")
//            }
//            print("aaaa")
//            print("--Lista tipos--")
            listaOcorrencias.fetch()
//            listaOcorrencias.startFetch()
//            locais = SetarLocais(listaOcorrencias: listaOcorrencias)
//            print("--Lista locais--")
            print(locais.count)
//            print("--Lista locais--")
        }.onDisappear(){
            //listaOcorrencias.stopFetch()
        }
    }
}

struct MainTeste_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
