//
//  CuriosityProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol CuriosityPresenterInput {
    func getCuriosityPhotos()
    func getMoreCuriosityPhotos(pageNo: Int)
    func getCameraFilterCuriosityPhotos(camera:String)
    func getMoreCameraFilterCuriosityPhotos(camera:String,pageNo:Int)
    
    func navigateToDetail(detail: Photos)
}

protocol CuriosityPresenterOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCuriosityPhotos(response: PhotosResponse)
    func didGetCameraFilterCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCameraFilterCuriosityPhotos(response: PhotosResponse)
}
protocol CuriosityInteractorOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCuriosityPhotos(response: PhotosResponse)
    func didGetCameraFilterCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCameraFilterCuriosityPhotos(response: PhotosResponse)
}

protocol CuriosityInteractorInput {
    func getCuriosityPhotos()
    func getMoreCuriosityPhotos(pageNo: Int)
    func getCameraFilterCuriosityPhotos(camera:String)
    func getMoreCameraFilterCuriosityPhotos(camera:String,pageNo:Int)
}

protocol CuriosityRouterProtocol{
    func navigateToDetail(detail: Photos)
}

