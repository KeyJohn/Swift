//
//  main.swift
//  Swift08-2
//
//  Created by keyzhang on 15/7/12.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//定义一个协议，要求遵循者实现certificate()方法
protocol CertificateGenerator {
    func certificate() -> String
}

class EncryptionGenerator: CertificateGenerator {
    var publicKey = "UDID"
    let privateKey = "123-456-789"
    func certificate() -> String {
        return publicKey + privateKey
    }
}

let generator = EncryptionGenerator()
print(generator.certificate())


