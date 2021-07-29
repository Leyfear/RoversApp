//
//  CuriosityProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol CuriosityPresenterInput {
    func getCuriosityPhotos(pageNo: Int)
    func getCameraFilterCuriosityPhotos(camera:String,pageNo:Int)
    func navigateToDetail(detail: Photos)
}

protocol CuriosityPresenterOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetError()
}

protocol CuriosityInteractorOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetError()
}

protocol CuriosityInteractorInput {
    func getCuriosityPhotos(pageNo: Int)
    func getCameraFilterCuriosityPhotos(camera:String,pageNo:Int)
}

protocol CuriosityRouterProtocol{
    func navigateToDetail(detail: Photos)
}
