//
//  NewsCell.swift
//  RooitTest
//
//  Created by YASYUAN LINANG on 2023/9/17.
//

import UIKit
import SDWebImage
class NewsCell: UITableViewCell {
    @IBOutlet weak var imgvPic: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    
    var viewModel: NewsItem? {
        didSet {
            if let vm = viewModel {
                lblContent.text = vm.title
                if let picUrl = URL(string: vm.image) {
                    imgvPic.sd_setImage(with: picUrl)
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
