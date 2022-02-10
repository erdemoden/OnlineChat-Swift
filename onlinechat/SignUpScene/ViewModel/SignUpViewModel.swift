//
//  SignUpViewModel.swift
//  onlinechat
//
//  Created by erdem öden on 10.02.2022.
//

import Foundation
import UIKit
import CoreData
protocol ShowAlert{
    func AlertCall(AlertMessage:String);
}
class SignUpViewModel{
    var Session = [SessionMod]();
    var Delegate:ShowAlert!;
    func PostSignUp(UserName:String,Password:String){
        let URL = URL(string: "localhost:1998/sign-up")!;
        var Request = URLRequest(url: URL);
        let Params = [
            "username":UserName,
            "password":Password
        ];
        Request.httpMethod = "POST";
        Request.setValue("Application/json", forHTTPHeaderField: "Content-Type");
        Request.httpBody = try? JSONSerialization.data(withJSONObject: Params, options: [])
        let Session = URLSession.shared.dataTask(with: URL) { (Data, Response, Error) in
            if(Error != nil){
                print("olmadı")
                // viewcontroller alert
            }
            else{
                if(Data != nil){
                    do{
                        //let JsonRes = try JSONSerialization.jsonObject(with: Data!, options: []);
                        let Appdelegate = UIApplication.shared.delegate as! AppDelegate
                        let Context = Appdelegate.persistentContainer.viewContext
                        let entity = NSEntityDescription.insertNewObject(forEntityName: "Session", into: Context);
                        self.Session = try JSONDecoder().decode([SessionMod].self, from: Data!);
                        if(self.Session[0].sessionid != "null"){
                        entity.setValue(self.Session[0].sessionid, forKey: "session");
                            
                            try Context.save()
                            
                        }
                        else{
                            // HATA MESAJI VER
                            self.Delegate.AlertCall(AlertMessage: self.Session[0].error)
                        }
                    }
                    catch{
                        print("error")
                    }
                }
                
            }
        }
        Session.resume();
        
    }
    
    
    
}
