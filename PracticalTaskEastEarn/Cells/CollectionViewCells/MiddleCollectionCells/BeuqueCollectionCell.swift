//
//  BeuqueCollectionCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 27/02/24.
//

import UIKit
import SDWebImage

class BeuqueCollectionCell: UICollectionViewCell {

    @IBOutlet weak var betiqueTitleLabel: UILabel!
    @IBOutlet weak var beuqueImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ object: BoutiqueCollection?) {
        self.beuqueImageView.sd_setImage(with: URL(string: object?.bannerImage ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
        self.betiqueTitleLabel.text = object?.name
    }

}
