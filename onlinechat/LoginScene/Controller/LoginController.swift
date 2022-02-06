//
//  LoginController.swift
//  onlinechat
//
//  Created by erdem öden on 6.02.2022.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var TitleBackGround: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isHidden = true
        TitleBackGround.layer.cornerRadius = 20;
        let Gesture = UITapGestureRecognizer(target: self.view, action:#selector(UIView.endEditing));
        view.addGestureRecognizer(Gesture);
    }
    @IBAction func ToSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUpStoryBoard", bundle: nil)
        let SignUp = storyboard.instantiateViewController(withIdentifier: "SignUp") as! SignUpController
        navigationController?.pushViewController(SignUp, animated: true);
    }
    
}
