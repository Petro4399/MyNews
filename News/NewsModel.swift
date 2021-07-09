//
//  NewsModel.swift
//  News
//
//  Created by Petro Starychok on 17.02.2021.
//

import UIKit

struct NewsModel: Codable {
    let id: String
    let publishDate: String
    let webPageURL: String
    let title: String
    let detailsInfo: String
    let imagePath: String
}
