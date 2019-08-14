/*:
 # Swift講習会 #2
 ## 演習問題
 ---
 問1. Rectプロトコルに適合させたRectangle**構造体**を定義しましょう.
 */

protocol Rect {
    var width:Double{set get}
    var height:Double{set get}
    func calcArea() -> Double
}

/*:
 ---
 問2. 以下の処理で何がprintされるか答えてください.
 */

class Man {
    var height:Double
    init(height:Double) {
        self.height = height
    }
}

let man1 = Man(height: 1.93)
let man2 = man1
man2.height = 1.52
print(man1.height, man2.height) // 答えになってしまうのでコメントアウト

/*:
 ---
 問3. 以下に示す挙動の違いがどうして起きるのか説明してください.
 */

protocol Car {
    var name:String {set get}
}

class CarClass:Car {
    var name:String
    init(name:String) {
        self.name = name
    }
}

struct CarStruct:Car {
    var name:String
    init(name:String) {
        self.name = name
    }
}

func changeName(car:Car) {
    var car = car // hint: 引数はlet扱いなので別の変数に移動させています
    car.name = "toyota"
}

let car1 = CarStruct(name: "nissan")
let car2 = CarClass(name: "nissan")
changeName(car: car1)
changeName(car: car2)
print(car1.name, car2.name) // "nissan" "toyota" <- なぜ???

/*:
 ---
 問4. Optional型の文字列(String)が与えられるので、Unwrapしてprintしてみましょう.もしnilであった場合は,"nil"と表示してみましょう.
 */

let mojis = [
    "a": "あ",
    "i": "い",
    "u": "う",
    "e": "え",
    "o": "お"
    ]
let moji = mojis["a"] // これを表示する(Optional型です)
