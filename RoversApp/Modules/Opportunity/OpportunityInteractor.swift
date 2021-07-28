//
//  OpportunityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class OpportunityInteractor {
    var output: OpportunityPresenterOutput?
    var result: PhotosResponse?
}

extension OpportunityInteractor: OpportunityInteractorInput {
    func getCameraFilterOpportunityPhotos(camera: String) {
        let url = "\(baseURL)opportunity/photos?sol=1000&camera=\(camera)&page=0&api_key=\(apiKey)"
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
                    self.output?.didGetCameraFilterOpportunityPhotos(response: json)
                }
            }
        }
        task.resume()
    }
    
    func getMoreCameraFilterOpportunityPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)opportunity/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
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
                    self.output?.didGetMoreCameraFilterOpportunityPhotos(response: json)
                }
            }
            
        }
        task.resume()
    }
    
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

