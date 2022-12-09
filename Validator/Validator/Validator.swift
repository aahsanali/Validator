//
//  Validator.swift
//  Validator
//
//  Created by Naveed A. on 12/9/22.
//

import Foundation

public struct Validator{
    
    public static func validateEmail(_ email:String) -> Bool{
        
        let validationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1

          let validationPredicate = NSPredicate(format: "SELF MATCHES %@", validationRegex)  // 2

          return validationPredicate.evaluate(with: email)  // 3
        
    }
    public static func letsGO(){
        print("in FRAMEWORK NEW ")
    }
}
