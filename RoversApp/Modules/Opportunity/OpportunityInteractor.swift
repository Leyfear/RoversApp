//
//  OpportunityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class OpportunityInteractor {
    var output: OpportunityPresenterOutput?
    var apiManager = APIManager()
}

extension OpportunityInteractor: OpportunityInteractorInput {

    
    func getCameraFilterOpportunityPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)opportunity/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetOpportunityPhotos(response: data)
            case .failure:
                self.output?.didGetError()
            }
        }
    }
    
    
    
    func getOpportunityPhotos(pageNo: Int) {
        let url = "\(baseURL)opportunity/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
        self.apiManager.sendRequest(for: PhotosResponse.self, url: url) { (data) in
            switch data {
            case .success(let data):
                self.output?.didGetOpportunityPhotos(response: data)
            case .failure(let error):
                print("errorMessage", error)
            }
        }
    }
}
