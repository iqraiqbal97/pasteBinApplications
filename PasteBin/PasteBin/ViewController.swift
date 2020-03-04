//
//  ViewController.swift
//  PasteBin
//
//  Created by Iqra Iqbal on 06/12/2019.
//  Copyright © 2019 Iqra Iqbal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var pasteText: UITextView!
    
    @IBAction func buttonPaste(_ sender: Any) {
        sendPaste(pasteText: pasteText.text)
    }
    
    let apiKey = "0219dd8a440c8204f8dee48ef8e55289"
    //SENNDPASTE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func sendPaste(pasteText:String)
    {
        //Pate bin API URL
               let url = URL(string: "https://pastebin.com/api/api_post.php")!
               var request = URLRequest(url: url)
               
               request.httpMethod = "POST" //Set request method to POST
               let bodyData = "api_dev_key=" + apiKey + "&api_option=paste&api_paste_code=" + pasteText
           
               request.httpBody = bodyData.data(using: String.Encoding.utf8)

               //Its like an ASYC task
               let task = URLSession.shared.dataTask(with: request){
                   (data, respose, error) in
                   if let error = error {
                       print("error: \(error)")
                   } else {
                       if let data = data, let dataString = String(data:data, encoding: .utf8){
                           print("url from paste bin: \(dataString)")
                       }
                   }
               }
               //EXECUTE FOR ASYNC TASK
               task.resume()
    }
    

}

