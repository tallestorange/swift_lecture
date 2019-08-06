/*:
 # Swift講習会 #1
 ## 演習問題
 ---
 
問1. 2つの定数を定義してみましょう.
 - Int型で8が格納された定数a
 - Int型で6が格納された定数b
 
 定数a, bの定義が済んだら, aとbの和を定数cに代入しましょう.
 */

/*:
 ---
問2. String型配列を定義しましょう.
 
 String型配列の中身はなんでもよいですが, 中身を1つずつ表示(print)してみましょう.
 
 ※for文を使います
 */

/*:
 ---
 問3. 以下の定数ageに対して処理分けをしましょう.
 - ageが20以上の際に"adult"と表示する
 - それ以外の場合は何もしない
 */

import Cocoa
let age = arc4random_uniform(100)

/*:
---
問4. Carクラスに対してメソッドを追加しましょう.
- nameプロパティをprintするvoid型メソッド
*/
class Car {
    let name:String
    init(name:String) {
        self.name = name
    }
}

/*:
 ---
 問5. 問3のCarクラスを継承してCrownクラスを定義しましょう.
 
 ※CrownにはhorsePowerプロパティ(Double型)があります. 追加しましょう.
 */

/*:
 ---
 問6. Rectプロトコルに適合させたRectangle**構造体**を定義しましょう.
 */

protocol Rect {
    var width:Double{set get}
    var height:Double{set get}
    func calcArea() -> Double
}
