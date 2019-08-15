/*:
# unwrapについて
 unwrapにはたくさんの種類があります。
 
 - Optionalがnilを含まないという確証があるとき
 
    - forced unwrap
    - Implicitly unwrapped optional
 - nilだった場合に処理を抜けたい場合
    - guard-let文
 - nilかどうかで場合分けしたい場合
    - if-let文
 - nilであった場合にデフォルト値をもたせたい場合
    - Nil Coalescing Operator(??文)
 
 unwrapしない方法もあります
 
 - unwrapしたくないが、中のメソッドやプロパティは使いたい
    - Optional Chaining
*/

let mojis = [
    "a": "あ",
    "i": "い",
    "u": "う",
    "e": "え",
    "o": "お"
]
let moji = mojis["a"] // mojiはString?型

/*:
 - forced unwrap
 
    Optional型変数に対して!をつけるとforced unwrapになります。

    もし、Optional型変数にnilが入っている場合にforced unwrapしてしまうと**クラッシュしてしまう**ので注意が必要です。
 */

let moji2 = moji! // moji2はString型

/*:
 - Implicitly unwrapped optional
 
    基本的にOptional型を定義する場合はString?のように、末尾に?をつける場合が多いですが、!をつけて定義することもあります。これがImplicitly unwrapped optionalです。
 
    その単語の意味通り、値を使用する際に暗黙的にunwrapがなされます。
 */

var moji3:String!
moji3 = "tanaka" // String!型
let moji4 = moji3 + " san" // String型
// moji3は使用時に暗黙的にunwrapされました
print(moji4)

/*:
 使う場面としてはIBOutletなどが挙げられます。それ以外で使用することはあまりありません。
 */

/*:
 - guard-let文
 
     Optional型変数の中身がnilであった場合に処理を抜けたい場合にはguard-let文を使用します。
 
     guard-let文は、Optional型変数の中身がnilであった場合には処理を抜け、nilでない場合は左辺にunwrapされた値を代入するための文です。
 
     else節ではreturnもしくはbreakを行う必要があります。もし行わない場合はビルドエラーとなります。
 */

func test1() {
    guard let moji5 = moji else {return}
    // if moji5 != nil {moji5 = moji!}
    print(moji5) // moji5はString型
}
test1() // "あ"

/*:
 - if-let文
 
     Optional型変数の中身がnilかどうかで処理を分けたい場合はif-let文を使用します。
 
     if-let文で定義した変数はif節の中でしか使えないので注意が必要です。
 */

if let moji6 = moji {
    print(moji6) // moji6はString型
}

/*:
 - Optional Chaining
 */
