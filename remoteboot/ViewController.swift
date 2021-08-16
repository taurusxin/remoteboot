//
//  ViewController.swift
//  remoteboot
//
//  Created by 张宇欣 on 2019/8/21.
//  Copyright © 2019 rhyland. All rights reserved.
//

import UIKit

class ViewController: UIViewController , GCDAsyncUdpSocketDelegate{
    @IBOutlet weak var bootButton: UIButton!
    @IBOutlet weak var IPAddress: UITextField!
    @IBOutlet weak var MACAddress: UITextField!
    @IBOutlet weak var Port: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IPAddress.text = Utils.getNormalDefult(key: "IP") as! String
        MACAddress.text = Utils.getNormalDefult(key: "MAC") as! String
        Port.text = Utils.getNormalDefult(key: "Port") as! String
    }
    
    var udpClient = GCDAsyncUdpSocket();
    
    @IBAction func click(_ sender: Any) {
        let mac = MACAddress.text
        let array  = mac?.components(separatedBy: ":")
        var woldata = Data()
        for _ in 1...6{
            woldata.append(255)
        }
        for _ in 1...16{
            for m in array!{
                woldata.append(UInt8(changeToInt(num: m)))
            }
        }
        udpClient.send(woldata, toHost: IPAddress.text ?? "", port: UInt16(Port.text!)!, withTimeout: -1, tag: 0)
        
    }
    
    func changeToInt(num:String)->Int{
        let str = num.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48
            if i>=65{
                sum -= 7
            }
        }
        return sum
    }
    @IBAction func saveData(_ sender: Any) {
        Utils.setNormalDefault(key: "IP", value: IPAddress.text! as NSString)
        Utils.setNormalDefault(key: "MAC", value: MACAddress.text! as NSString)
        Utils.setNormalDefault(key: "Port", value: Port.text! as NSString)
    }
    
}

