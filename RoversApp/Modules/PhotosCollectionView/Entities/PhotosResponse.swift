//
//  PhotosResponse.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

//MARK: - PhotosResponseDTO
struct PhotosResponse: Codable,Equatable {

    

    let photos: [Photos]?
    static func == (lhs: PhotosResponse, rhs: PhotosResponse) -> Bool {
        lhs.photos == rhs.photos
    }

    private enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        photos = try values.decode([Photos].self, forKey: .photos)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(photos, forKey: .photos)
    }

}

//MARK: - PhotosResponse
struct Photos: Codable,Equatable {

    

    let id: Int?
    let sol: Int?
    let camera: Camera?
    let imgSrc: String?
    let earthDate: String?
    let rover: Rover?

    static func == (lhs: Photos, rhs: Photos) -> Bool {
        lhs.id == rhs.id
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case sol = "sol"
        case camera = "camera"
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover = "rover"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        sol = try values.decode(Int.self, forKey: .sol)
        camera = try values.decode(Camera.self, forKey: .camera)
        imgSrc = try values.decode(String.self, forKey: .imgSrc)
        earthDate = try values.decode(String.self, forKey: .earthDate)
        rover = try values.decode(Rover.self, forKey: .rover)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(sol, forKey: .sol)
        try container.encode(camera, forKey: .camera)
        try container.encode(imgSrc, forKey: .imgSrc)
        try container.encode(earthDate, forKey: .earthDate)
        try container.encode(rover, forKey: .rover)
    }

}
//MARK: - CameraResponse
struct Camera: Codable {

    let id: Int?
    let name: String?
    let roverId: Int?
    let fullName: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case roverId = "rover_id"
        case fullName = "full_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        roverId = try values.decode(Int.self, forKey: .roverId)
        fullName = try values.decode(String.self, forKey: .fullName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(roverId, forKey: .roverId)
        try container.encode(fullName, forKey: .fullName)
    }

}
//MARK: - RoverResponse
struct Rover: Codable {

    let id: Int?
    let name: String?
    let landingDate: String?
    let launchDate: String?
    let status: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        landingDate = try values.decode(String.self, forKey: .landingDate)
        launchDate = try values.decode(String.self, forKey: .launchDate)
        status = try values.decode(String.self, forKey: .status)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(landingDate, forKey: .landingDate)
        try container.encode(launchDate, forKey: .launchDate)
        try container.encode(status, forKey: .status)
    }

}
