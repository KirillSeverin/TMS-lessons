//
//  ValidateService.swift
//  SRP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

class ValidateService {

    static let shared = ValidateService()
    private init() { }

    public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
