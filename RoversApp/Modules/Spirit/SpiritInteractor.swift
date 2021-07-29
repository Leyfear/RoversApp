//
//  SpiritInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class SpiritInteractor {
    var output: SpiritPresenterOutput?
    var apiManager = APIManager()
}

extension SpiritInteractor: SpiritInteractorInput {
    
    func getCameraFilterSpiritPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)spirit/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetSpiritPhotos(response: data)
            case .failure:
                self.output?.didGetError()
            }
        }
    }
    
    func getSpiritPhotos(pageNo: Int) {
        let url = "\(baseURL)spirit/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetSpiritPhotos(response: data)
            case .failure(let error):
                print("errorMessage", error)
            }
        }
    }
}
