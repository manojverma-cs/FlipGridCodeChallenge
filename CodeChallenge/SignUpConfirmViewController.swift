//
//  SignUpConfirmViewController.swift
//  CodeChallenge
//
//  Created by MANOJ VEMRA on 12/8/21.
//

import UIKit

class SignUpConfirmViewController: UIViewController {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!

    var sections: [DataModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
    }

    func setupUI() {
        submitButton.setTitle(LocalizedStrings.signinTitle, for: .normal)
        submitButton.layer.cornerRadius = 10
        profileImageView.layer.cornerRadius = 15
        profileImageView.layer.masksToBounds = true
        summaryLabel.text = LocalizedStrings.protfolioSubmittedMessage
        for section in sections ?? [] {
            switch section.section {
            case .avatar:
                profileImageView.image = UIImage(contentsOfFile: "\(section.value)")
            case .firstName:
                self.title = LocalizedStrings.protfolioSubmittedTitle(section.value)
                nameLabel.text = section.value
            case .email:
                emailLabel.text = section.value
            case .website:
                let underlineAttriString = NSAttributedString(string: section.value,
                                                          attributes: [NSAttributedString.Key.underlineStyle:
                                                                        NSUnderlineStyle.single.rawValue])
                websiteLabel.attributedText = underlineAttriString
            default:
                break
            }
        }
        if let section = sections?.first(where: { $0.section == .avatar }) {
            profileImageView.image = UIImage(contentsOfFile: "\(section.value)")
        }
        if let section = sections?.first(where: { $0.section == .avatar }) {
            profileImageView.image = UIImage(contentsOfFile: "\(section.value)")
        }
    }
}
