//
//  CuriosityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class CuriosityInteractor {
    var output: CuriosityPresenterOutput?
}

extension CuriosityInteractor: CuriosityInteractorInput {
    func getMoreCuriosityPhotos(pageNo: Int) {
        let url = "\(baseURL)curiosity/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
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
                    self.output?.didGetMoreCuriosityPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    
    func getCuriosityPhotos() {
        let url = "\(baseURL)curiosity/photos?sol=1000&page=0&api_key=\(apiKey)"
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
                    self.output?.didGetCuriosityPhotos(response: json)
                }
            }

        }
        task.resume()
    }
    
}
