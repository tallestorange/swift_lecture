/*:
 # クラスと構造体
 
 Swiftになってから,クラスと構造体の違いがほとんどなくなりました.
 
 では,一体何が同じで何が違うのか,おさらいしましょう.
 
 
 ## 1. クラスは参照型, 構造体は値型
 値の受け渡しを行ったときに挙動の違いが顕著に現れます.
 */

protocol Car {
    var weight:Double {set get}
}
class CarClass:Car {
    var weight:Double
    init (weight:Double) {
        self.weight = weight
    }
}
struct CarStruct:Car {
    var weight:Double
    init (weight:Double) {
        self.weight = weight
    }
}

/*:
 CarClassクラスを作成して試してみましょう.
 */

let car1 = CarClass(weight: 1.0)
let car2 = car1
car2.weight = 2.0
print(car1.weight, car2.weight) // 2.0 2.0

/*:
 CarClassクラスのインスタンスであるcar1をcar2にコピーしています.
 
 このときコピーしているのはインスタンスの値ではなく, インスタンスの参照です.
 
 そのため, car1とcar2は同じインスタンスを参照していることになります.
 
 同じところを参照しているため, car2への変更がcar1に波及しました.
 
 次はCarStruct構造体で試してみましょう.
 */

let car3 = CarStruct(weight: 1.0)
var car4 = car3
car4.weight = 2.0
print(car3.weight, car4.weight) // 1.0 2.0

/*:
 このときはcar4に対してcar3の値自体がコピーされたので, car4に変更を加えてもcar3に波及しません.
 
 値自体をコピーしているため, 意図しない値の変更を回避する事ができました.
 
 値として渡したいか, 参照として渡したいかで構造体とクラスを使い分けていく必要があります.
 */

/*:
 ## 2. 構造体は構造体を継承することができない
 
クラスは,クラスを継承して新しいクラスを作ることができます.

 */
