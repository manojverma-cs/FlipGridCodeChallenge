//
//  SignUpTableViewController+UITableView.swift
//  CodeChallenge
//
//  Created by MANOJ VEMRA on 12/8/21.
//

import UIKit

extension SignUpTableViewController {

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0,
           let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: SignUpViewConstants.headerViewCellId)
            as? HeaderViewCell {
            cell.titleLabel.text = LocalizedStrings.profileCreationDescription
            return cell
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? SignUpViewConstants.headerViewHeight : 0
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == tableView.numberOfSections - 1,
           let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: SignUpViewConstants.footerViewCellId)
            as? FooterViewCell {
            cell.delegate = self
            return cell
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        section == tableView.numberOfSections - 1 ? SignUpViewConstants.footerViewHeight : 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].section {
        case .avatar:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SignUpViewConstants.avatarCellId)
                as? AvatarTableViewCell {
                cell.delegate = self
                cell.configure(sections[indexPath.section])
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SignUpViewConstants.dataInputCellId)
                as? DataInputTableViewCell {
                cell.delegate = self
                cell.configure(sections[indexPath.section], tag: indexPath.section)
                return cell
            }
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
