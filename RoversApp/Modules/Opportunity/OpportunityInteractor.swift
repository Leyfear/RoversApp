//
//  OpportunityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class OpportunityInteractor {
    var output: OpportunityPresenterOutput?
}

extension OpportunityInteractor: OpportunityInteractorInput {
    func getOpportunityPhotos() {
        let url = "\(baseURL)opportunity/photos?sol=1000&page=0&api_key=\(apiKey)"
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
                    self.output?.didGetOpportunityPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    
    func getMoreOpportunityPhotos(pageNo: Int) {
        let url = "\(baseURL)opportunity/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
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
                    self.output?.didGetMoreOpportunityPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    

    
}

