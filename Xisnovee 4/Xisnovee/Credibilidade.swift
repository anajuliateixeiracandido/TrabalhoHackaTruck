//
//  Credibilidade.swift
//  Xisnovee
//
//  Created by Student on 14/06/23.
//

import SwiftUI

struct Credibilidade: View {
    @State var ocorrencia: Ocorrencia
//    var ocorrencia: Ocorrencia
    @Environment(\.presentationMode) var presentationMode
    @State private var cor = "CinzaClaro"
    @State private var isLiked = false
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("\(ocorrencia.latitude)")
                Text("\(ocorrencia.longitude)")
                Text(ocorrencia.tipo)
                Text("Credibilidade:\(ocorrencia.credibilidade)")
            }.padding(.bottom, 20)
            HStack(spacing:50){
                Button("Like") {
                    let numero = (ocorrencia.credibilidade + 1.0);
                    print("ocorrencia")
                    print((ocorrencia))
                    print("\(numero)")
                    sendPutRequest(updateOcorrencia: Ocorrencia(_id: ocorrencia._id,
                                                                _rev: ocorrencia._rev,
                                                                latitude: ocorrencia.latitude,
                                                                longitude: ocorrencia.longitude,
                                                                tipo: ocorrencia.tipo,
                                                                credibilidade: numero))
                }
//                }){
//
//                    Image(systemName: "hand.thumbsup.fill")
//                        .foregroundStyle(.green)
//                        .imageScale(.large)
//                        .font(.system(size: 70))
//                        .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.green, lineWidth: 5))
//                }
//
//                Button("Disike") {
//                    let numero = (ocorrencia.credibilidade - 1.0);
//                    print("ocorrencia")
//                    print((ocorrencia))
//                    print("\(numero)")
//                    sendPutRequest(updateOcorrencia: Ocorrencia(_id: ocorrencia._id,
//                                                                _rev: ocorrencia._rev,
//                                                                latitude: ocorrencia.latitude,
//                                                                longitude: ocorrencia.longitude,
//                                                                tipo: ocorrencia.tipo,
//                                                                credibilidade: numero))
//                }
                
//                Button(action: {
//                    let numero:Double = ocorrencia.credibilidade - 1.0
//                    sendPutRequest(updateOcorrencia: Ocorrencia(_id: ocorrencia._id,
//                                                                _rev: ocorrencia._rev,
//                                                                latitude: ocorrencia.latitude,
//                                                                longitude: ocorrencia.longitude,
//                                                                tipo: ocorrencia.tipo,
//                                                                credibilidade: numero))
//                }){
//
//                    Image(systemName: "hand.thumbsdown.fill")
//                        .foregroundStyle(.red)
//                        .imageScale(.large)
//                        .font(.system(size: 70))
//                        .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.red, lineWidth: 5))
//
//                }
            }
        }.background(Color(cor))
    }
}

//struct Credibilidade_Previews: PreviewProvider {
//    static var previews: some View {
//        Credibilidade()
//    }
//}
