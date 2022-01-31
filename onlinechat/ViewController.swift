//
//  ViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var isHamburgerMenuShown:Bool = false
    @IBOutlet weak var HamburgerRight: NSLayoutConstraint!
    @IBOutlet weak var TitleBackGround: UIView!
    @IBOutlet weak var ChatTables: UITableView!
    @IBOutlet weak var HamburgerBackView: UIView!
    @IBAction func MenuClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.1){
            self.HamburgerRight.constant = 10;
            self.view.layoutIfNeeded();
        } completion: { (status) in
            self.HamburgerBackView.alpha = 0.75
            self.HamburgerBackView.isHidden = false
            UIView.animate(withDuration: 0.1) {
                self.HamburgerRight.constant = 0
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isHamburgerMenuShown = true
            }
        }
        HamburgerBackView.isHidden = false;
        HamburgerRight.constant = 0;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = ChatTables.dequeueReusableCell(withIdentifier: "Chats", for: indexPath) as! ChatTables
        return Cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Gesture = UITapGestureRecognizer(target: self, action: #selector(BackHamburgerTapped));
        HamburgerBackView.addGestureRecognizer(Gesture);
        ChatTables.delegate = self;
        ChatTables.dataSource = self;
        ChatTables.separatorStyle = .none;
        TitleBackGround.layer.cornerRadius = 20;
        HamburgerBackView.isHidden = true;
        // Do any additional setup after loading the view.
    }
    @objc func BackHamburgerTapped(){
        self.HideHamburger();
        
    }
    func HideHamburger(){
        UIView.animate(withDuration: 0.1) {
            self.HamburgerRight.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.HamburgerBackView.alpha = 0.0
            UIView.animate(withDuration: 0.1) {
                self.HamburgerRight.constant = -280
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.HamburgerBackView.isHidden = true
                self.isHamburgerMenuShown = false
            }
        }
    }

}

