//
//  SignUpTableViewController+CameraManagerDelegate.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/8/21.
//

import UIKit

extension SignUpTableViewController: CameraManagerDelegate {
    func useImage(_ image: UIImage) {
        if let index = sections.firstIndex(where: { $0.section == .avatar }) {
            do {
                try image.pngData()?.write(to: URL(fileURLWithPath: FileManager.avatarImagePath()),
                                           options: Data.WritingOptions.atomic)
                sections[index].value = FileManager.avatarImagePath()
                tableView.reloadData()
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}
