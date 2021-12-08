//
//  AvatarTableViewCell.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/6/21.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarButton.layer.cornerRadius = 15
        avatarButton.backgroundColor = .opaqueSeparator
    }

    /// override prepareForReuse to reset content before reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarButton.setImage(nil, for: .normal)
    }

    /// configure cell from DataModel
    /// - Parameter dataModel: DataModel object to prefill the data
    func configure(_ dataModel: DataModel) {
        avatarButton.setTitle(dataModel.section.placeholder,
                              for: .normal)
    }
}
