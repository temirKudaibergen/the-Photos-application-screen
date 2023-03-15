//
//  ListSection.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

enum ListSection {
    case myAlbums([ListItem])
    case peopleAndPlaces([ListItem])
    case mediaTypes([ListItem])
    case utilities([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .mediaTypes(let items),
                .myAlbums(let items),
                .peopleAndPlaces(let items),
                .utilities(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .myAlbums(_):
            return "Мои альбомы"
        case .peopleAndPlaces(_):
            return "Люди и места"
        case .mediaTypes(_):
            return "Медиатека"
        case .utilities(_):
            return "Другое"
        }
    }
}
