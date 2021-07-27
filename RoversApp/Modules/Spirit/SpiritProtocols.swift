//
//  SpiritProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol SpiritPresenterInput {
    func getSpiritPhotos()
    func getMoreSpiritPhotos(pageNo: Int)
    func navigateToDetail(detail: Photos)
}

protocol SpiritPresenterOutput {
    func didGetSpiritPhotos(response: PhotosResponse)
    func didGetMoreSpiritPhotos(response: PhotosResponse)
}
protocol SpiritInteractorOutput {
    func didGetSpiritPhotos(response: PhotosResponse)
    func didGetMoreSpiritPhotos(response: PhotosResponse)
}

protocol SpiritInteractorInput {
    func getSpiritPhotos()
    func getMoreSpiritPhotos(pageNo: Int)
}

protocol SpiritRouterProtocol{
    func navigateToDetail(detail: Photos)
}

