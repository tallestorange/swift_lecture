/*:
 # クロージャとデリゲート
 ## クロージャを使う
 
 何かの処理のあとに処理をさせたい場合に,関数の引数としてクロージャを渡すという手段が考えられます.
 */

func doSomething() {
    print("hogehoge")
}

func hoge(completion:() -> ()) {
    print("before") // 前処理
    completion()
}

hoge(completion: {() -> Void in
    doSomething() // 終了後にやる処理
})

/*:
 ## デリゲートを使う
 よくやるパターンですね.
 デリゲートとはあくまで実装の1パターンにすぎません.
 */

protocol DoSomethingDelegate {
    func onCompletion()
}

class DoSomething {
    var delegate:DoSomethingDelegate?
    func start() {
        print("before")
        delegate?.onCompletion()
    }
}

class TestDelegate:DoSomethingDelegate {
    func onCompletion() {
        doSomething()
    }
}

let test = DoSomething()
test.delegate = TestDelegate()
test.start()
