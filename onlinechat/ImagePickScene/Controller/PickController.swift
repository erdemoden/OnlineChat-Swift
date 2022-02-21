//
//  PickController.swift
//  onlinechat
//
//  Created by erdem öden on 20.02.2022.
//

import UIKit

class PickController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var ChosenImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    @IBAction func PickImage(_ sender: Any) {
        let Picker = UIImagePickerController();
        Picker.delegate = self;
        Picker.sourceType = .photoLibrary;
        Picker.allowsEditing = true;
        present(Picker, animated: true, completion: nil);
    }
    @IBAction func AcceptPhoto(_ sender: Any) {
        
    }
    @IBAction func Cancel(_ sender: Any) {
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ChosenImage.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil);
    }
}
