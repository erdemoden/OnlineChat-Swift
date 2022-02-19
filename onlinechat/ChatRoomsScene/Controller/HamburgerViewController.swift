//
//  HamburgerViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class HamburgerViewController: UIViewController {
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var ProfilePic: UIImageView!
    var ViewModel = HamburgerVM();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetHamburgerRadious();
        let arr = ViewModel.SetNameImage();
        if(arr["image"]  == nil){
            ProfilePic.image = UIImage(named: "profile-pic");
        }
        else{
            ProfilePic.image = UIImage(data: arr["image"] as! Data);
        }
        UserName.text = arr["username"] as! String;
    }
    
    func SetHamburgerRadious(){
        self.BackGroundView.layer.cornerRadius = 40;
        self.BackGroundView.clipsToBounds = true;
        
        self.ProfilePic.layer.cornerRadius = 40;
        self.ProfilePic.clipsToBounds = true;
    }
    @IBAction func LogOutBut(_ sender: Any) {
        
    }
    

}