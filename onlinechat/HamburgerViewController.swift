//
//  HamburgerViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class HamburgerViewController: UIViewController {
    @IBOutlet weak var BackGroundView: UIView!
    @IBOutlet weak var ProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetHamburgerRadious();
    }
    
    func SetHamburgerRadious(){
        self.BackGroundView.layer.cornerRadius = 40;
        self.BackGroundView.clipsToBounds = true;
        
        self.ProfilePic.layer.cornerRadius = 40;
        self.ProfilePic.clipsToBounds = true;
    }

}
