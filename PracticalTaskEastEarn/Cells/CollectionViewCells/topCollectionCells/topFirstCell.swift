//
//  topFirstCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit
import SDWebImage

class topFirstCell: UICollectionViewCell {

    @IBOutlet weak var febImageView: UIImageView!
    @IBOutlet weak var febTitleLabel: UILabel!
    @IBOutlet weak var backView: CustomUIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ object: MainStickyMenu?) {
        self.febImageView.contentMode = .scaleAspectFill
        self.febTitleLabel.text = object?.title
        self.febImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
    }

}
