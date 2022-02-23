//
//  PickViewModel.swift
//  onlinechat
//
//  Created by erdem öden on 20.02.2022.
//

import Foundation
import CoreData
import UIKit
import Alamofire;
class PickViewModel{
    let AppDelegate:AppDelegate!
    let Context:NSManagedObjectContext!
    var username = "";
    var myavatar:UIImage;
    init(myavatar:UIImage){
        self.AppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.Context = AppDelegate.persistentContainer.viewContext
        self.myavatar = myavatar;
    }
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    func SavePhoto(){
      let imageData: Data = myavatar.jpegData(compressionQuality: 0.5)!;
//        let imageStr:String = imageData.base64EncodedString();
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Session");
        fetch.returnsObjectsAsFaults = false;
        do{
        let results = try self.Context.fetch(fetch);
        for result in results as! [NSManagedObject]{
            self.username = result.value(forKey: "name") as! String;
            }
        }
        catch{
            print("error var");
        }
        let URL = URL(string:"http://localhost:1998/upload-image/\(self.username)")!;
//        var Request = URLRequest(url: URL);
//        let paramstr = "file=\(imageStr)";
//        let paramdata:Data = paramstr.data(using: .utf8) ?? Data();
//        let boundary = UUID().uuidString
//        Request.httpMethod = "POST";
//        Request.setValue("multipart/form-data; boundary=\(boundary)",forHTTPHeaderField: "Content-Type")
//        Request.httpBody = paramdata;
//       let Session = URLSession.shared.dataTask(with: Request) { Data, Response, Error in
//            if(Error != nil){
//                print("olmadı")
//                // viewcontroller alert
//            }
//            else{
//                if(Data != nil){
//                    do{
//                        let RecievedData = try JSONSerialization.jsonObject(with: Data!, options: []) as? [String:Any];
//                        if(RecievedData!["error"] as! String != "nil"){
//                            print("Yok Olmuyor");
//                        }
//                        else{
//                            print(RecievedData!["error"] as! String);
//                        }
//                    }
//                    catch{
//                        print("error");
//                    }
//                }
//            }
//        }
//        Session.resume();
        
        AF.upload(multipartFormData:{Multipart in Multipart.append(imageData, withName: "avatar", fileName: "avatar.jpg", mimeType: "image/jpeg")}, to:"http://localhost:1998/upload-image/\(self.username)").responseJSON{
            response in
            switch response.result {
                case .success:
                        print("osu")
                    
                case .failure(let error):
                    print(error)
                }
        }
//        let params = ["avatar":imageData];
//        AF.request("http://localhost:1998/upload-image/\(self.username)", method: .post, parameters: params, encoding:URLEncoding.httpBody)
        
       print("http://localhost:1998/upload-image/\(self.username)")
    }
}
