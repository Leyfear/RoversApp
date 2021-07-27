//
//  CuriosityProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol CuriosityPresenterInput {
    func getCuriosityPhotos()
    func getMoreCuriosityPhotos(pageNo: Int)
    func navigateToDetail(detail: Photos)
}

protocol CuriosityPresenterOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCuriosityPhotos(response: PhotosResponse)
}
protocol CuriosityInteractorOutput {
    func didGetCuriosityPhotos(response: PhotosResponse)
    func didGetMoreCuriosityPhotos(response: PhotosResponse)
}

protocol CuriosityInteractorInput {
    func getCuriosityPhotos()
    func getMoreCuriosityPhotos(pageNo: Int)
}

protocol CuriosityRouterProtocol{
    func navigateToDetail(detail: Photos)
}

