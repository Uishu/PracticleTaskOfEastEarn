//
//  Model.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import Foundation

struct MainStruct {
    let home: Home
    let category: Category
}

// MARK: - Home
struct Home: Codable {
    let mainStickyMenu: [MainStickyMenu]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case mainStickyMenu = "main_sticky_menu"
        case status, message
    }
}

// MARK: - MainStickyMenu
struct MainStickyMenu: Codable {
    let title: String
    let image: String
    let sortOrder: String
    let sliderImages: [MainStickyMenu]?
    let cta: String?

    enum CodingKeys: String, CodingKey {
        case title, image
        case sortOrder = "sort_order"
        case sliderImages = "slider_images"
        case cta
    }
}
// MARK: - Category
struct Category: Codable {
    let shopByCategory, shopByFabric: [ShopBy]
    let unstitched: [Unstitched]
    let boutiqueCollection: [BoutiqueCollection]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case shopByCategory = "shop_by_category"
        case shopByFabric = "shop_by_fabric"
        case unstitched = "Unstitched"
        case boutiqueCollection = "boutique_collection"
        case status, message
    }
}

// MARK: - BoutiqueCollection
struct BoutiqueCollection: Codable {
    let bannerImage: String
    let name, cta, bannerID: String

    enum CodingKeys: String, CodingKey {
        case bannerImage = "banner_image"
        case name, cta
        case bannerID = "banner_id"
    }
}

// MARK: - ShopBy
struct ShopBy: Codable {
    let categoryID: String?
    let name: String
    let tintColor: String?
    let image: String
    let sortOrder: String
    let fabricID: String?

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case name
        case tintColor = "tint_color"
        case image
        case sortOrder = "sort_order"
        case fabricID = "fabric_id"
    }
}

// MARK: - Unstitched
struct Unstitched: Codable {
    let rangeID, name, description: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case rangeID = "range_id"
        case name, description, image
    }
}
// MARK: - Botom
struct Botom: Codable {
    let rangeOfPattern: [RangeOfPattern]
    let designOccasion: [DesignOccasion]
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case rangeOfPattern = "range_of_pattern"
        case designOccasion = "design_occasion"
        case status, message
    }
}

// MARK: - DesignOccasion
struct DesignOccasion: Codable {
    let productID, name: String
    let image: String
    let subName, cta: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, image
        case subName = "sub_name"
        case cta
    }
}

// MARK: - RangeOfPattern
struct RangeOfPattern: Codable {
    let productID: String
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case image, name
    }
}
// MARK: - SetCategory
struct SetCategory: Codable {
    let categories: [ChildCategory]
    let bannerImage: String
    let status, message: String

    enum CodingKeys: String, CodingKey {
        case categories
        case bannerImage = "banner_image"
        case status, message
    }
}

// MARK: - Category
struct ChildCategory: Codable {
    let categoryID, categoryName, parentID: String
    let child: [ChildCategory]?
    var isExpand: Bool = false

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categoryName = "category_name"
        case parentID = "parent_id"
        case child
    }
}
