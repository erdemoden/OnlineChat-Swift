//
//  LoginController.swift
//  onlinechat
//
//  Created by erdem öden on 6.02.2022.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
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
    
    @IBAction func LogIn(_ sender: Any) {
        if(PasswordField.text?.isEmpty == true||((NameField.text?.isEmpty == true))){
            let Alert = UIAlertController(title: "Please Fill Both Name And Password Fields", message: "You Should Enter Password And Name", preferredStyle: .alert);
            let Action = UIAlertAction(title: "Ok", style: .default, handler: nil);
            Alert.addAction(Action);
            self.present(Alert, animated: true, completion: nil);
        }
        else{
            ViewModel.PostLogin(UserName: NameField.text!, Password: PasswordField.text!)
        }
    }
    
    
}
extension LoginController:ShowLogAlert{
    func SessionCreated() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let MainScene = storyboard.instantiateViewController(withIdentifier: "MainScene") as! ViewController
            self.navigationController?.pushViewController(MainScene, animated: true);
        }
    }
    
    func AlertCall(AlertMessage: String) {
        DispatchQueue.main.async {
            let Alert = UIAlertController(title: "ERROR!", message: AlertMessage, preferredStyle: .alert);
            let Action = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            Alert.addAction(Action);
            self.present(Alert, animated: true, completion: nil);
        }
    }
    
    
    
}
