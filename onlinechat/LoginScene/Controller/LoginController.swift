//
//  LoginController.swift
//  onlinechat
//
//  Created by erdem öden on 6.02.2022.
//

import UIKit

class LoginController: UIViewController {
    var ViewModel = LoginViewModel();
    @IBOutlet weak var TitleBackGround: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isHidden = true
        TitleBackGround.layer.cornerRadius = 20;
        let Gesture = UITapGestureRecognizer(target: self.view, action:#selector(UIView.endEditing));
        view.addGestureRecognizer(Gesture);
        ViewModel.Delegate = self;
    }
    @IBAction func ToSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUpStoryBoard", bundle: nil)
        let SignUp = storyboard.instantiateViewController(withIdentifier: "SignUp") as! SignUpController
        navigationController?.pushViewController(SignUp, animated: true);
    }
    
}
extension LoginController:ShowLogAlert{
    func AlertCall(AlertMessage: String) {
        DispatchQueue.main.async {
            let Alert = UIAlertController(title: "ERROR!", message: AlertMessage, preferredStyle: .alert);
            let Action = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            Alert.addAction(Action);
            self.present(Alert, animated: true, completion: nil);
        }
    }
    
    
}
