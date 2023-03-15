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
        .myAlbums([.init(image: "Recent",title: "Недавние",countFiles: Int.random(in: 1...234)),
                   .init(image: "WhatsApp", title: "WhatsApp", countFiles: Int.random(in: 1...234)),
                   .init(image: "RecInstagrament", title: "Instagram", countFiles: Int.random(in: 1...234)),
                   .init(image: "Favorites", title: "Избранные", countFiles: Int.random(in: 1...234)),
                   .init(image: "NOMO", title: "NOMO", countFiles: Int.random(in: 1...234)),
                   .init(image: "VN", title: "VN", countFiles: Int.random(in: 1...234)),
                   .init(image: "Lightroom", title: "Lightroom", countFiles: Int.random(in: 1...234)),
                   .init(image: "Pinterest", title: "Pinterest", countFiles: Int.random(in: 1...234))
        ])
    }()
    
    private let peopleAndPlaces: ListSection = {
        .peopleAndPlaces([
            .init(image: "people", title: "Люди", countFiles: 12),
            .init(image: "place", title: "Места", countFiles: 315)
        ])
    }()
    
    private let mediaTypes: ListSection = {
        .mediaTypes([
            .init(image: "video", title: "Видео", countFiles: 118),
            .init(image: "person.crop.square", title: "Селфи", countFiles: 45),
            .init(image: "livephoto", title: "Фото live Photos", countFiles: 115),
            .init(image: "cube", title: "Портреты", countFiles: 15),
            .init(image: "slowmo", title: "Замедленно", countFiles: 1),
            .init(image: "video.and.waveform", title: "Киноэффект", countFiles: 1),
            .init(image: "camera.viewfinder", title: "Снимки экрана", countFiles: 11),
            .init(image: "dot.circle.viewfinder", title: "Записи экрана", countFiles: 4),
            .init(image: "r.square.on.square", title: "RAW", countFiles: 123)
        ])
    }()
    
    private let utilities: ListSection = {
        .utilities([
            .init(image: "arrow.down.app", title: "Импортированные", countFiles: 0),
            .init(image: "square.on.square", title: "Дубликаты", countFiles: 0),
            .init(image: "trash", title: "Недавно удаленные", countFiles: 0)
        ])
    }()
    
    var pageData: [ListSection] {
        [myAlbums, peopleAndPlaces, mediaTypes, utilities]
    }
}
