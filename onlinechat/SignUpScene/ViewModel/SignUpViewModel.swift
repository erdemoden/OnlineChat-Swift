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
    let AppDelegate:AppDelegate!
    let Context:NSManagedObjectContext!
    init() {
        self.AppDelegate = UIApplication.shared.delegate as? AppDelegate
        self.Context = AppDelegate.persistentContainer.viewContext
    }
    func PostSignUp(UserName:String,Password:String){
        let URL = URL(string: "http://localhost:1998/sign-up")!;
        var Request = URLRequest(url: URL);
//        let Params = [
//            "username":UserName,
//            "password":Password
//        ];
        let Params = ["username":UserName,"password":Password];
        Request.httpMethod = "POST";
        Request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        Request.setValue("application/json", forHTTPHeaderField: "Accept")
        let HttpBody = try? JSONSerialization.data(withJSONObject: Params, options: []);
        Request.httpBody = HttpBody;
        let Session = URLSession.shared.dataTask(with: Request) { [self] (Data, Response, Error) in
            if(Error != nil){
                print("olmadı")
                // viewcontroller alert
            }
            else{
                if(Data != nil){
                    do{
                        //let JsonRes = try JSONSerialization.jsonObject(with: Data!, options: []);
                        let entity = NSEntityDescription.insertNewObject(forEntityName: "Session", into: self.Context);
                        self.Session = try JSONDecoder().decode([SessionMod].self, from: Data!);
                        print(self.Session[0].error);
                        if(self.Session[0].sessionid != "null"){
                        entity.setValue(self.Session[0].sessionid, forKey: "session");
                            try self.Context.save()
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
