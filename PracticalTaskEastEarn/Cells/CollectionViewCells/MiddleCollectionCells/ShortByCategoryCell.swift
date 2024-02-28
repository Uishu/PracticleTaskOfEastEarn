//
//  ShortByCategoryCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit

class ShortByCategoryCell: UICollectionViewCell {

    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catTitleLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func categoryConfigCell(_ object: ShopBy?) {
        self.catTitleLabel.text = "\(object?.name ?? "")"
        self.catView.backgroundColor = hexStringToUIColor(hex: object?.tintColor ?? "#FFFFFF")
        self.catImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
    }
    
    func designAsPerConfigCell(_ object: DesignOccasion?) {
        self.catTitleLabel.text = "\(object?.name ?? "")"
        self.catView.backgroundColor = hexStringToUIColor(hex: "#B6B5B7")
        self.catImageView.sd_setImage(with: URL(string: object?.image ?? ""), placeholderImage: UIImage(named: "shopping-bag"))
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
