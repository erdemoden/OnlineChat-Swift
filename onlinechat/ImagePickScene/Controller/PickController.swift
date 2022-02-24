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
            let ViewModel = PickViewModel(myavatar: ChosenImage.image!);
            ViewModel.SavePhoto();
        DispatchQueue.main.async {
            let Alert = UIAlertController(title: "Photo Saved", message: "Chosen Photo Added To Your Profile", preferredStyle: .alert);
            let Action = UIAlertAction(title: "OK", style: .default, handler: nil);
            Alert.addAction(Action);
            self.present(Alert, animated: true, completion: nil);
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
