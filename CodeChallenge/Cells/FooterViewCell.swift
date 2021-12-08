//
//  FooterViewCell.swift
//  CodeChallenge
//
//  Created by MANOJ VEMRA on 12/8/21.
//

import UIKit

protocol FooterViewDelegate: class {
    func submitButtonAction()
}

class FooterViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var submitButton: UIButton!
    weak var delegate: FooterViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        submitButton.layer.cornerRadius = 5
    }

    @IBAction func submitButtonAction(_ sender: UIButton) {
        delegate?.submitButtonAction()
    }
}
