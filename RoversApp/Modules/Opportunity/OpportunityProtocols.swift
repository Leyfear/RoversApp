//
//  OpportunityProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol OpportunityPresenterInput {
    func getOpportunityPhotos()
    func getMoreOpportunityPhotos(pageNo: Int)
    func getCameraFilterOpportunityPhotos(camera:String)
    func getMoreCameraFilterOpportunityPhotos(camera:String,pageNo:Int)
    
    func navigateToDetail(detail: Photos)
}

protocol OpportunityPresenterOutput {
    func didGetOpportunityPhotos(response: PhotosResponse)
    func didGetMoreOpportunityPhotos(response: PhotosResponse)
    func didGetCameraFilterOpportunityPhotos(response: PhotosResponse)
    func didGetMoreCameraFilterOpportunityPhotos(response: PhotosResponse)
}
protocol OpportunityInteractorOutput {
    func didGetOpportunityPhotos(response: PhotosResponse)
    func didGetMoreOpportunityPhotos(response: PhotosResponse)
    func didGetCameraFilterOpportunityPhotos(response: PhotosResponse)
    func didGetMoreCameraFilterOpportunityPhotos(response: PhotosResponse)
}

protocol OpportunityInteractorInput {
    func getOpportunityPhotos()
    func getMoreOpportunityPhotos(pageNo: Int)
    func getCameraFilterOpportunityPhotos(camera:String)
    func getMoreCameraFilterOpportunityPhotos(camera:String,pageNo:Int)
}

protocol OpportunityRouterProtocol{
    func navigateToDetail(detail: Photos)
}

