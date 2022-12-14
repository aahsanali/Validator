//
//  LoginViewController.swift
//  4ARTLogin
//
//  Created by Coeus on 18/11/2022.
//

import UIKit

public class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
   
    @IBOutlet weak var txtEmail: UITextField!
    
    var activityView: UIActivityIndicatorView?

    public override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        let deviceName = "iPhone (iPhone13,2)"
        let deviceUUID = UIDevice.current.identifierForVendor?.uuidString ?? ""

        let loginInfo = ["email" : txtEmail.text ?? "",
                         "plainPassword" : txtPassword.text ?? "",
                        "os" : "iOS",
                        "app" : "4ART",
                        "token" : "5e60dcfada6c64d2ad3e40e035780da95a479d16346a87d1a4bc5001146330e7",
                        "device_uuid" : deviceUUID,
                         "device_name" : deviceName] as [String : String]
        DispatchQueue.main.async {
            self.showActivityIndicator()
        }
        NetworkManager.shared.sendPostRequest("https://api-pre-live.4art-technologies.com/api/v1/user-login", parameters: loginInfo) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
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
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
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
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

