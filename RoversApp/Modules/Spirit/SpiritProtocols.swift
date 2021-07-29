//
//  SpiritProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol SpiritPresenterInput {
    func getSpiritPhotos(pageNo: Int)
    func getCameraFilterSpiritPhotos(camera:String,pageNo:Int)
    func navigateToDetail(detail: Photos)
}

protocol SpiritPresenterOutput {
    func didGetSpiritPhotos(response: PhotosResponse)
    func didGetError()
}

protocol SpiritInteractorOutput {
    func didGetSpiritPhotos(response: PhotosResponse)
    func didGetError()
}

protocol SpiritInteractorInput {
    func getSpiritPhotos(pageNo: Int)
    func getCameraFilterSpiritPhotos(camera:String,pageNo:Int)
}

protocol SpiritRouterProtocol{
    func navigateToDetail(detail: Photos)
}
