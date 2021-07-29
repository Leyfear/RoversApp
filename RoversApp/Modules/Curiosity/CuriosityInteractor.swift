//
//  CuriosityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class CuriosityInteractor {
    var output: CuriosityPresenterOutput?
    var apiManager = APIManager()
}

extension CuriosityInteractor: CuriosityInteractorInput {
    
    func getCameraFilterCuriosityPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)curiosity/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetCuriosityPhotos(response: data)
            case .failure:
                self.output?.didGetError()
            }
        }
    }
    
    func getCuriosityPhotos(pageNo: Int) {
        let url = "\(baseURL)curiosity/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetCuriosityPhotos(response: data)
            case .failure(let error):
                print("errorMessage", error)
            }
        }
    }
}
