//
//  String+Ext.swift
//  CodeChallenge
//
//  Created by MANOJ VEMRA on 12/8/21.
//

import Foundation

extension String {
    /// validate web link
    /// - Returns: Bool instance of result
    func isLink() -> Bool {
        autoreleasepool {
            guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
                return false
            }
            let text = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if let match = detector.matches(in: text,
                                            options: [],
                                            range: NSRange(location: 0, length: text.utf16.count)).first,
               let range = Range(match.range, in: text) {
                let rangeText = text[range]
                if text.isValidEmail() {
                    return false
                }
                if rangeText == text {
                    return true
                }
            }
            return false
        }
    }

    /// validate string for email address
    /// - Returns: Bool instance of result
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
