//
//  SignUpController.swift
//  onlinechat
//
//  Created by erdem öden on 6.02.2022.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var TitleBackGround: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleBackGround.layer.cornerRadius = 20;
        let Gesture = UITapGestureRecognizer(target: self.view, action:#selector(UIView.endEditing));
        view.addGestureRecognizer(Gesture);
    }
    @IBAction func ToLogIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        let LogIn = storyboard.instantiateViewController(withIdentifier: "LogIn") as! LoginController
        navigationController?.pushViewController(LogIn, animated: true);
    }
    
}
extension ViewController:ShowAlert{
    func AlertCall(AlertMessage: String) {
        let Alert = UIAlertController(title: "ERROR!", message: AlertMessage, preferredStyle: .alert);
        let Action = UIAlertAction(title: "OK", style: .cancel, handler: nil);
        Alert.addAction(Action);
        self.present(Alert, animated: true, completion: nil);
    }
    
    
}
