import Foundation

struct PostOcorrencia : Codable{
    let latitude: Double
    let longitude: Double
    let tipo: String
    let credibilidade: Double
}

struct Ocorrencia: Codable{
    let _id: String
    let _rev: String
    let latitude: Double
    let longitude: Double
    let tipo: String
    let credibilidade: Double
}

func sendPostRequest(postOcorrencia: PostOcorrencia) {
    let url = URL(string: "http://192.168.128.247:1880/ocorrencia/new")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let parameters: [String: Any] = [
        "latitude": postOcorrencia.latitude,
        "longitude": postOcorrencia.longitude,
        "tipo": postOcorrencia.tipo,
        "credibilidade": postOcorrencia.credibilidade
    ]
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
    request.httpBody = jsonData
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Erro: \(error.localizedDescription)")
        } else if let data = data {
            // Manipule os dados de resposta aqui
            let responseString = String(data: data, encoding: .utf8)
            print("Resposta: \(String(describing: responseString))")
        }
    }
    task.resume()
}

func sendPutRequest(updateOcorrencia: Ocorrencia) {
//    let updateOcorrencia = Ocorrencia(
//        _id: "9a9100f5dacb280148013eba96c512c2",
//        _rev: "1-d718d1b53e85e1c2ed7abb70fa3a8dff",
//        latitude: -44.1041374206543,
//        longitude: -19.90266227722168,
//        tipo: "ala hu kiba",
//        credibilidade: 500)
    let url = URL(string: "http://192.168.128.247:1880/ocorrencia/update")!
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    let parameters: [String: Any] = [
        "_id": updateOcorrencia._id,
        "_rev": updateOcorrencia._rev,
        "latitude": updateOcorrencia.latitude,
        "longitude": updateOcorrencia.longitude,
        "tipo": updateOcorrencia.tipo,
        "credibilidade": updateOcorrencia.credibilidade
    ]
    let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
    request.httpBody = jsonData
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Erro: \(error.localizedDescription)")
        } else if let data = data {
            // Manipule os dados de resposta aqui
            let responseString = String(data: data, encoding: .utf8)
            print("Resposta: \(String(describing: responseString))")
        }
    }
    task.resume()
}

class OcorrenciaVM : ObservableObject {
    @Published var lista : [Ocorrencia] = []
    @Published var listaLocal : [Local] = []
    var timer: Timer?
//    func startFetch(){
//        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {_ in
//            self.fetch()
//        })
//    }
    
//    func stopFetch(){
//        timer?.invalidate()
//        timer = nil
//    }
    
    func fetch(){
        
        guard let url = URL(string: "http://192.168.128.247:1880/ocorrencia/getAll2" ) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Ocorrencia].self, from: data)
                DispatchQueue.main.async {
                    self?.lista = parsed
                    self?.listaLocal = SetarLocais(listaOcorrencias: parsed)
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

