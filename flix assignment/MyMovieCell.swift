//
//  MyMovieCell.swift
//  flix assignment
//
//  Created by Grace Brill on 8/30/21.
//

import UIKit

class MyMovieCell: UITableViewCell {
    
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
