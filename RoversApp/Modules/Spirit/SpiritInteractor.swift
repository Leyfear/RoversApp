//
//  SpiritInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class SpiritInteractor {
    var output: SpiritPresenterOutput?
}

extension SpiritInteractor: SpiritInteractorInput {
    func getSpiritPhotos() {
        let url = "\(baseURL)spirit/photos?sol=1000&page=0&api_key=\(apiKey)"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            var result: PhotosResponse?
            do {
                result = try JSONDecoder().decode(PhotosResponse.self, from: data)
                
            }catch{
                print("failed")
            }
            DispatchQueue.main.async {
                if let json = result {
                    self.output?.didGetSpiritPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    
    func getMoreSpiritPhotos(pageNo: Int) {
        let url = "\(baseURL)spirit/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            var result: PhotosResponse?
            do {
                result = try JSONDecoder().decode(PhotosResponse.self, from: data)
                
            }catch{
                print("failed")
            }
            DispatchQueue.main.async {
                if let json = result {
                    self.output?.didGetMoreSpiritPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    

    
}

