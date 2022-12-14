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
//        Validator().btnLoginPressed()
    }
    /*
    func btnLoginPressed() {
        let deviceName = "iPhone (iPhone13,2)"
        let deviceUUID = UIDevice.current.identifierForVendor?.uuidString ?? ""

        let loginInfo = ["email" : "naveed.ahsan@coeus-solutions.de",
                         "plainPassword" :"Coeus123$",
                        "os" : "iOS",
                        "app" : "4ART",
                        "token" : "5e60dcfada6c64d2ad3e40e035780da95a479d16346a87d1a4bc5001146330e7",
                        "device_uuid" : deviceUUID,
                         "device_name" : deviceName] as [String : String]
        DispatchQueue.main.async {
//            self.showActivityIndicator()
        }
        NetworkManager.shared.sendPostRequest("https://api-pre-live.4art-technologies.com/api/v1/user-login", parameters: loginInfo) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
//                    self.hideActivityIndicator()
                    let alert = UIAlertController(title: "Alert", message: "Unable to login", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                            case .default:
                            print("default")
                            
                            case .cancel:
                            print("cancel")
                            
                            case .destructive:
                            print("destructive")
                            
                        @unknown default:
                            print("unknown")
                        }
                    }))
                }
            }
            else{
                DispatchQueue.main.async {
//                    self.hideActivityIndicator()
                    let alert = UIAlertController(title: "Alert", message: "Successfuly login", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                            case .default:
                            print("default")
                            
                            case .cancel:
                            print("cancel")
                            
                            case .destructive:
                            print("destructive")
                            
                        @unknown default:
                            print("unknown")
                        }
                    }))

                }
            }
        }
    }
     */
}
