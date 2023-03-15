//
//  MockData.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

struct MockData {
    static let shared = MockData()
    
    private let myAlbums: ListSection = {
        .myAlbums([.init(image: UIImage(named: "Recent") ?? UIImage.remove,title: "Недавние",countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "WhatsApp") ?? UIImage.remove, title: "WhatsApp", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "RecInstagrament") ?? UIImage.remove, title: "Instagram", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "Favorites") ?? UIImage.remove, title: "Избранные", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "NOMO") ?? UIImage.remove, title: "NOMO", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "VN") ?? UIImage.remove, title: "VN", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "Lightroom") ?? UIImage.remove, title: "Lightroom", countFiles: Int.random(in: 1...234)),
                   .init(image: UIImage(named: "Pinterest") ?? UIImage.remove, title: "Pinterest", countFiles: Int.random(in: 1...234))
        ])
    }()
    
    private let peopleAndPlaces: ListSection = {
        .peopleAndPlaces([
            .init(image: UIImage(named: "people") ?? UIImage.remove, title: "Люди", countFiles: 12),
            .init(image: UIImage(named: "place") ?? UIImage.remove, title: "Места", countFiles: 315)
        ])
    }()
    
    private let mediaTypes: ListSection = {
        .mediaTypes([
            .init(image: UIImage(systemName: "video") ?? UIImage.remove, title: "Видео", countFiles: 118),
            .init(image: UIImage(systemName: "person.crop.square") ?? UIImage.remove, title: "Селфи", countFiles: 45),
            .init(image: UIImage(systemName: "livephoto") ?? UIImage.remove, title: "Фото live Photos", countFiles: 115),
            .init(image: UIImage(systemName: "cube") ?? UIImage.remove, title: "Портреты", countFiles: 15),
            .init(image: UIImage(systemName: "slowmo") ?? UIImage.remove, title: "Замедленно", countFiles: 1),
            .init(image: UIImage(systemName: "video.and.waveform") ?? UIImage.remove, title: "Киноэффект", countFiles: 1),
            .init(image: UIImage(systemName: "camera.viewfinder") ?? UIImage.remove, title: "Снимки экрана", countFiles: 11),
            .init(image: UIImage(systemName: "dot.circle.viewfinder") ?? UIImage.remove, title: "Записи экрана", countFiles: 4),
            .init(image: UIImage(systemName: "r.square.on.square") ?? UIImage.remove, title: "RAW", countFiles: 123)
        ])
    }()
    
    private let utilities: ListSection = {
        .utilities([
            .init(image: UIImage(systemName: "arrow.down.app") ?? UIImage.remove, title: "Импортированные", countFiles: 0),
            .init(image: UIImage(systemName: "square.on.square") ?? UIImage.remove, title: "Дубликаты", countFiles: 0),
            .init(image: UIImage(systemName: "trash") ?? UIImage.remove, title: "Недавно удаленные", countFiles: 0)
        ])
    }()
    
    var pageData: [ListSection] {
        [myAlbums, peopleAndPlaces, mediaTypes, utilities]
    }
}
