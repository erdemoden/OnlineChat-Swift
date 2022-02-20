//
//  HamburgerViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class HamburgerViewController: UIViewController{
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var ProfilePic: UIImageView!
    var ViewModel = HamburgerVM();
    override func viewWillAppear(_ animated: Bool) {
        self.SetHamburgerRadious();
        let arr = ViewModel.SetNameImage();
            ProfilePic.image = UIImage(data: arr["image"] as! Data);
        UserName.text = arr["username"] as! String;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel.Delegate = self;
    }
    
    func SetHamburgerRadious(){
        self.BackGroundView.layer.cornerRadius = 40;
        self.BackGroundView.clipsToBounds = true;
        
        self.ProfilePic.layer.cornerRadius = 40;
        self.ProfilePic.clipsToBounds = true;
    }
    @IBAction func LogOutBut(_ sender: Any) {
        ViewModel.LogOut();
    }
    
    
}
extension HamburgerViewController : GoingBackToLogin{
    func LogOut() {
        let storyboard = UIStoryboard(name: "LoginStoryBoard", bundle: nil)
        let Login = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginController
        self.navigationController?.pushViewController(Login, animated: true);
    }
}
