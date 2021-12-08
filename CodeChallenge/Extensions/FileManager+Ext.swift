//
//  FileManager+Ext.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/8/21.
//

import Foundation
import UIKit

extension FileManager {
    /// path for document direcotory
    /// - Returns: String instance of  document direcotory path
    class func documentsDir() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }

    /// path for avatar image path
    /// - Returns: String instance of  document direcotory path for avatar image
    class func avatarImagePath() -> String {
        documentsDir().appending("/avatar.png")
    }
}
