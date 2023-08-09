//
//  Type.swift
//  Xisnovee
//
//  Created by Student18 on 13/06/23.
//

import Foundation

struct Tipo : Codable {
    let _id: String
    let _rev: String
    let descricao: String
    let icone: String
}

class TipoVM : ObservableObject {
    @Published var tipos : [Tipo] = []
    func fetch(){
        print("teste fetch")
        guard let url = URL(string: "http://192.168.128.247:1880/ocorrencia/getAllTypes" ) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Tipo].self, from: data)
                DispatchQueue.main.async {
                    self?.tipos = parsed
                }
            }catch{
                print(error)
            }
        }
        print("teste fetch end")
        for x in tipos{
            print(x.descricao)
        }
        task.resume()
    }
}
