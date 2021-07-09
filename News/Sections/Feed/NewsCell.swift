//
//  NewsCell.swift
//  News
//
//  Created by Petro Starychok on 17.02.2021.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var listLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    private var model: NewsModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.contentMode = .scaleAspectFill
        
    }

    func setup(_ item: NewsModel) {
        self.model = item
        titleLbl.text = item.title
        timeLbl.text = item.publishDate
        listLbl.text = item.webPageURL
        
        
        
        ImageService.getImage(withPath: item.imagePath) {[weak self] (image, imagePath) in
            if self?.model?.imagePath == imagePath {
                self?.imgView.image = image
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
        imgView.image = nil
    }
}

