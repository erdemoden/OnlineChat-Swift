//
//  ViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var isHamburgerMenuShown:Bool = false
    private var BeginPoint:CGFloat = 0.0;
    private var Difference:CGFloat = 0.0;
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
    
    
    //-MARK: Hamburger Menu Movement Code

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isHamburgerMenuShown){
            if let touch = touches.first{
                let location = touch.location(in: HamburgerBackView);
                BeginPoint = location.x;
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isHamburgerMenuShown){
            if let touch = touches.first{
                let location = touch.location(in: HamburgerBackView);
                let DifferenceFromBeginPoint = BeginPoint-location.x;
                if(DifferenceFromBeginPoint > 0 && DifferenceFromBeginPoint < 280){
                    self.HamburgerRight.constant = -DifferenceFromBeginPoint;
                    self.Difference = DifferenceFromBeginPoint;
                    self.HamburgerBackView.alpha = 0.75-(0.75*DifferenceFromBeginPoint/280);
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(isHamburgerMenuShown){
            if let touch = touches.first{
                let location = touch.location(in: HamburgerBackView);
                
                // Close Hamburger Menu
                if(Difference>140){
                    UIView.animate(withDuration: 0.1) {
                        self.HamburgerRight.constant = -280;
                    } completion: { (status) in
                        self.isHamburgerMenuShown = false;
                        self.HamburgerBackView.isHidden = true;
                    }
                }
                // Open Hamburger Menu
                else{
                    UIView.animate(withDuration: 0.1){
                        self.HamburgerRight.constant = 0;
                    } completion: { (status) in
                        self.isHamburgerMenuShown = true;
                        self.HamburgerBackView.isHidden = false;
                    }
                }
            }
        }
    }
}

