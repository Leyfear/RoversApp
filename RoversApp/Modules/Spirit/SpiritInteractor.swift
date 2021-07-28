//
//  SpiritInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class SpiritInteractor {
    var output: SpiritPresenterOutput?
    var result: PhotosResponse?
}

extension SpiritInteractor: SpiritInteractorInput {
    func getCameraFilterSpiritPhotos(camera: String) {
        let url = "\(baseURL)spirit/photos?sol=1000&camera=\(camera)&page=0&api_key=\(apiKey)"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            do {
                self.result = try JSONDecoder().decode(PhotosResponse.self, from: data)
                
            } catch {
                print("failed")
            }
            DispatchQueue.main.async {
                if let json = self.result {
                    self.output?.didGetCameraFilterSpiritPhotos(response: json)
                }
            }
        }
        task.resume()
    }
    
    func getMoreCameraFilterSpiritPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)spirit/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            
            do {
                self.result = try JSONDecoder().decode(PhotosResponse.self, from: data)
                
            }catch{
                print("failed")
            }
            DispatchQueue.main.async {
                if let json = self.result {
                    self.output?.didGetMoreCameraFilterSpiritPhotos(response: json)
                }
            }
            
        }
        task.resume()
    }
    
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
