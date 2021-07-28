//
//  CuriosityInteractor.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class CuriosityInteractor {
    var output: CuriosityPresenterOutput?
    var result: PhotosResponse?
}

extension CuriosityInteractor: CuriosityInteractorInput {
    func getMoreCameraFilterCuriosityPhotos(camera: String, pageNo: Int) {
        let url = "\(baseURL)curiosity/photos?sol=1000&camera=\(camera)&page=\(pageNo)&api_key=\(apiKey)"
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
                    self.output?.didGetMoreCameraFilterCuriosityPhotos(response: json)
                }
            }
            
        }
        task.resume()
    }
    
    func getCameraFilterCuriosityPhotos(camera: String) {
        let url = "\(baseURL)curiosity/photos?sol=1000&camera=\(camera)&page=0&api_key=\(apiKey)"
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
                    self.output?.didGetCameraFilterCuriosityPhotos(response: json)
                }
            }
        }
        task.resume()
    }
    
    func getMoreCuriosityPhotos(pageNo: Int) {
        let url = "\(baseURL)curiosity/photos?sol=1000&page=\(pageNo)&api_key=\(apiKey)"
        print("getMoreCuriosityPhotos", url)
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
            do {
                self.result = try JSONDecoder().decode(PhotosResponse.self, from: data)
                
            } catch {
                print("failed")
            }
            DispatchQueue.main.async {
                if let json = self.result {
                    self.output?.didGetCuriosityPhotos(response: json)
                }
            }
        }
        task.resume()
    }
}

