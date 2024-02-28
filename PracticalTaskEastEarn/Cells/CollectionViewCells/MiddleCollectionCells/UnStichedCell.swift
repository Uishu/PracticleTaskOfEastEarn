//
//  UnStichedCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 27/02/24.
//

import UIKit

class UnStichedCell: UICollectionViewCell {

    @IBOutlet weak var unstichTitleLabel: UILabel!
    @IBOutlet weak var unstichDiscriptionLabel: UILabel!
    @IBOutlet weak var unstichImageVIEW: UIImageView!
    
    func transformToLarge(){
        UIView.animate(withDuration: 0.2){
            self.transform = CGAffineTransform(scaleX: 1.09, y: 1.09)
        }
    }
    
    func transformToStandard(){
        UIView.animate(withDuration: 0.2){
            self.transform = CGAffineTransform.identity
        }
    }
    
    func configureCell(_ object: Unstitched?) {
        self.unstichDiscriptionLabel.text = object?.description
        self.unstichImageVIEW.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
        self.unstichTitleLabel.text = object?.name
    }

}
