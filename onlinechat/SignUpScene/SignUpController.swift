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
}
