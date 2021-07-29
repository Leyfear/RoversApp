//
//  OpportunityProtocols.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

protocol OpportunityPresenterInput {
    func getOpportunityPhotos(pageNo: Int)
    func getCameraFilterOpportunityPhotos(camera:String,pageNo:Int)
    func navigateToDetail(detail: Photos)
}

protocol OpportunityPresenterOutput {
    func didGetOpportunityPhotos(response: PhotosResponse)
    func didGetError()
}
protocol OpportunityInteractorOutput {
    func didGetOpportunityPhotos(response: PhotosResponse)
    func didGetError()
}

protocol OpportunityInteractorInput {
    func getOpportunityPhotos(pageNo: Int)
    func getCameraFilterOpportunityPhotos(camera:String,pageNo:Int)
}

protocol OpportunityRouterProtocol{
    func navigateToDetail(detail: Photos)
}
