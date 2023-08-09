import SwiftUI

struct TelaRegistro: View {
    @State private var showingSheet = false
    @StateObject var listaTipos: TipoVM
    @StateObject var listaOcorrencias: OcorrenciaVM
    // var postOcorrencia2 =
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.black, .red)
                    .imageScale(.large)
                Text("Registro de ocorrência")
                    .font(.title3)
                Spacer()
            }.padding(.vertical, 6.0)
                .foregroundColor(.black)
                .fontWeight(.bold)
            ScrollView{
                VStack(spacing: 8){
                    ForEach(listaTipos.tipos, id: \._id) { tipo in
                        Button(action: {
                            for ocorrencia in listaOcorrencias.lista{
                                print(ocorrencia._rev)
                            }
                            showingSheet.toggle()//                            sendPutRequest()
                            var  postOcorrencia2 = PostOcorrencia(latitude: -19.9026615,
                                                                  longitude: -44.1041363,
                                                                  tipo: tipo.descricao,//tipo.descricao,
                                                                  credibilidade: 10)
                            sendPostRequest(postOcorrencia: postOcorrencia2)
                            
                        }) {
                            HStack {
                                Image(systemName: tipo.icone)
                                    .foregroundColor(.black)
                                    .imageScale(.large)
                                    .frame(maxWidth: 50, maxHeight: 50)
                                Text(tipo.descricao)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            
                        }
                        .buttonStyle(.bordered)
                        
                        .background(.white)
                        
                        .cornerRadius(110)
                        
                        .padding(.horizontal, 12.0)
                        
                        
                        
                        .sheet(isPresented: $showingSheet) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.white, .green)
                                .imageScale(.large)
                            
                            Text("Ocorrência registrada")
                            Text("Obrigada")
                        }
                    }
                }
                
            }
            
            
        }.onAppear{
            print(listaTipos.tipos.count)
            print(listaOcorrencias.lista.count)
            print(listaOcorrencias.listaLocal.count)
        }
        .foregroundColor(.white)
        .background(Color("CinzaClaro"))
    }
}

//struct TelaRegistro_Previews: PreviewProvider {
//    static var previews: some View {
//        TelaRegistro()
//    }
//}
