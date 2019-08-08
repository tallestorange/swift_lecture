/*:
 # Swift講習会 #3
 ## 演習問題
 ---
 問1. 以下に示したクロージャ(closure)を実行してください.
 */

let closure = {() -> Void in
    print("hello world")
}

/*:
 ---
 問2. 何かの処理を行ったあとに引数のクロージャを実行する関数closureTestを用意しました.
 引数にクロージャを渡してclosureTest関数を実行してください.
 */

func closureTest(completion:() -> Void) {
    print("何かの処理")
    completion()
}

/*:
 ---
 問3. 50%の確率でエラーを返す関数causeErrorを用意しました.エラーが発生しなかった場合に戻り値のStringを表示(print)するコードを書いてみましょう.
 
 */

import Cocoa

struct SomeError:Error {
    let name:String
}

func causeError() throws -> String {
    if arc4random_uniform(100) >= 50 {
        return "tanaka"
    }
    throw SomeError(name: "unlucky") // 50%でErrorになる
}

