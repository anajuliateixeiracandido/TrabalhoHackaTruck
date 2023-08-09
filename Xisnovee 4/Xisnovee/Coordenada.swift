import Foundation
import MapKit

struct Local: Identifiable{
    var id = UUID()
    var coordenada: CLLocationCoordinate2D
    var descricao: String
//    var icone: String
}
    //@StateObject var listaOcorrencias = OcorrenciaVM()

func SetarLocais(listaOcorrencias: [Ocorrencia]) -> [Local]{
    var listaLocais: [Local] = []
    for ocorrencia in listaOcorrencias{
        listaLocais.append(Local(coordenada: CLLocationCoordinate2D(latitude: ocorrencia.latitude,
                                                                longitude: ocorrencia.longitude),
                                 descricao: ocorrencia.tipo
                                 //icone: ocorrencia.
        ))
    }
    return listaLocais;
}
