//
//  Utils.swift
//  remoteboot
//
//  Created by 张宇欣 on 2019/9/6.
//  Copyright © 2019 rhyland. All rights reserved.
//

import UIKit

class Utils: NSObject {
    /*  使用NSUserDefaults对普通数据对象储存   */
    
    /**
     储存
     
     - parameter key:   key
     - parameter value: value
     */
    class func setNormalDefault(key:String, value:AnyObject?){
        if value == nil {
            UserDefaults.standard.removeObject(forKey: key)
        }
        else{
            UserDefaults.standard.set(value, forKey: key)
            // 同步
            UserDefaults.standard.synchronize()
        }
    }
    
    /**
     通过对应的key移除储存
     
     - parameter key: 对应key
     */
    class func removeNormalUserDefault(key:String?){
        if key != nil {
            UserDefaults.standard.removeObject(forKey: key!)
            UserDefaults.standard.synchronize()
        }
    }
    
    /**
     通过key找到储存的value
     
     - parameter key: key
     
     - returns: AnyObject
     */
    class func getNormalDefult(key:String)->AnyObject?{
        return UserDefaults.standard.value(forKey: key) as! AnyObject
    }
}
