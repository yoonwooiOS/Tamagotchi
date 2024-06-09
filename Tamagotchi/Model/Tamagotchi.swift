//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit

struct Tamagotchi {
    
    let name: String
    var image: String
    var describe: String
}
extension Tamagotchi {
    
    static var savedData: Bool = false
    static var savedName: String?
    static var savedImage: String?
    
  static let list:[Tamagotchi] = [
    Tamagotchi(name: "따끔따끔 다마고치", image: "1-6", describe: "저는 따끔따끔 다모고치 입니당 키는 180km\n몸무게는 100톤이에용\n성격은 날카롭고 뛰어다닌답니당~!\n한 번 키워보실래요? 잘 클 자신은\n 있답니당 따끔!"),
    Tamagotchi(name: "방실방실 다마고치", image: "2-6", describe: "저는 방실방실 다모고치 입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닌답니당~!\n열심히 잘 먹고 잘 클 자신은\n 있답니당 방실방실!"),
    Tamagotchi(name: "반짝반짝 다마고치", image: "3-6", describe: "저는 반짝반짝 다모고치 입니당 키는 80km\n몸무게는 70톤이에용\n성격은 조용하고 걸어다닌답니당~!\n저 키워주세요 잘 클 자신은\n 있답니당 반짝반짝!"),
    Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
    Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: ""),
        Tamagotchi(name: "준비중이에요", image: "noImage", describe: "")
        
        
    ]
}
