//
//  Section.swift
//  CodeChallenge
//
//  Created by MANOJ VERMA on 12/7/21.
//

import UIKit

/// enum to populate different section inside of tableview
enum Section: Int {
    case avatar
    case firstName
    case email
    case password
    case website

    var placeholder: String {
        switch self {
        case .avatar:
            return LocalizedStrings.avatarTitle
        case .firstName:
            return LocalizedStrings.firstNameTitle
        case .email:
            return LocalizedStrings.emailAddressTitle
        case .password:
            return LocalizedStrings.passwordTitle
        case .website:
            return LocalizedStrings.websiteTitle
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .avatar:
            return .default
        case .firstName:
            return .default
        case .email:
            return .emailAddress
        case .password:
            return .default
        case .website:
            return .webSearch
        }
    }

    var isSecureTextEntry: Bool {
        switch self {
        case .password:
            return true
        default:
            return false
        }
    }
}
