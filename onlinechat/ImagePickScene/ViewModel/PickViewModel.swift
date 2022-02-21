//
//  PickViewModel.swift
//  onlinechat
//
//  Created by erdem öden on 20.02.2022.
//

import Foundation
import CoreData
import UIKit
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
    func SavePhoto(){
        let imageData: Data = myavatar.jpegData(compressionQuality: 0.5)!;
        let imageStr:String = imageData.base64EncodedString();
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Session");
        fetch.returnsObjectsAsFaults = false;
        do{
        let results = try self.Context.fetch(fetch);
        for result in results as! [NSManagedObject]{
            self.username = result.value(forKey: "name") as! String;
            }
        }
        catch{
            print("error");
        }
        let URL = URL(string:"http://localhost:1998/upload-image")!;
        var Request = URLRequest(url: URL);
        let Params = [
            "name":self.username,
            "avatar":imageStr
        ] as [String : Any];
        Request.httpMethod = "POST";
        Request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        Request.httpBody = try? JSONSerialization.data(withJSONObject: Params, options: [])
        
        URLSession.shared.dataTask(with: Request) { Data, Response, Error in
            if(Error != nil){
                print("olmadı")
                // viewcontroller alert
            }
            else{
                if(Data != nil){
                    do{
                        let RecievedData = try JSONSerialization.jsonObject(with: Data!, options: []) as? [String:Any];
                        if(RecievedData!["error"] as! String != "nil"){
                            print("Yok Olmuyor");
                        }
                        else{
                            print(RecievedData!["error"] as! String);
                        }
                    }
                    catch{
                        print("error");
                    }
                }
            }
        }
    }
}
