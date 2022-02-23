//
//  PickController.swift
//  onlinechat
//
//  Created by erdem öden on 20.02.2022.
//

import UIKit

class PickController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//https://last-airbender-api.herokuapp.com/api/v1/characters
    var PhotoAdded = false;
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
        PhotoAdded = true;
    }
    @IBAction func AcceptPhoto(_ sender: Any) {
        if(PhotoAdded == true){
            let ViewModel = PickViewModel(myavatar: ChosenImage.image!);
            ViewModel.SavePhoto();
        }
        else{
            let Controller = UIAlertController(title: "Please Choose Photo", message: "You should choose photo from url", preferredStyle: .alert);
            let Action = UIAlertAction(title: "OK", style: .default, handler: nil);
            Controller.addAction(Action);
            self.present(Controller, animated: true, completion: nil);
        }
    }
    @IBAction func Cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ChosenImage.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil);
    }
}
