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
        .myAlbums([.init(image: "Recent",title: "Недавние",filesCount: "765"),
                   .init(image: "Instagram", title: "Instagram", filesCount: "54"),
                   .init(image: "WhatsApp", title: "WhatsApp", filesCount: "43"),
                   .init(image: "Favorites", title: "Избранные", filesCount: "32"),
                   .init(image: "NOMO", title: "NOMO", filesCount: "34"),
                   .init(image: "VN", title: "VN", filesCount: "78"),
                   .init(image: "Lightroom", title: "Lightroom", filesCount: "76"),
                   .init(image: "Pinterest", title: "Pinterest", filesCount: "55")
        ])
    }()
    
    private let peopleAndPlaces: ListSection = {
        .peopleAndPlaces([
            .init(image: "people", title: "Люди", filesCount: "12"),
            .init(image: "place", title: "Места", filesCount: "315")
        ])
    }()
    
    private let mediaTypes: ListSection = {
        .mediaTypes([
            .init(image: "video", title: "Видео", filesCount: "118"),
            .init(image: "person.crop.square", title: "Селфи", filesCount: "45"),
            .init(image: "livephoto", title: "Фото live Photos", filesCount: "115"),
            .init(image: "cube", title: "Портреты", filesCount: "15"),
            .init(image: "slowmo", title: "Замедленно", filesCount: "1"),
            .init(image: "video.and.waveform", title: "Киноэффект", filesCount: "1"),
            .init(image: "camera.viewfinder", title: "Снимки экрана", filesCount: "11"),
            .init(image: "dot.circle.viewfinder", title: "Записи экрана", filesCount: "4"),
            .init(image: "r.square.on.square", title: "RAW", filesCount: "123")
        ])
    }()
    
    private let utilities: ListSection = {
        .utilities([
            .init(image: "arrow.down.app", title: "Импортированные", filesCount: "0"),
            .init(image: "square.on.square", title: "Дубликаты", filesCount: "0"),
            .init(image: "trash", title: "Недавно удаленные", filesCount: "0")
        ])
    }()
    
    var pageData: [ListSection] {
        [myAlbums, peopleAndPlaces, mediaTypes, utilities]
    }
}
