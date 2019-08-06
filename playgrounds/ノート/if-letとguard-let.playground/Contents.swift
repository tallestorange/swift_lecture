/*:
 # if-letとguard-let
 ## guard-let
 
 値がnilであった場合に処理を抜ける必要がある場合に使用します.
 
 guard letのelse節では,必ずbreakかreturnをする必要があるので,ブロックからの抜け忘れがなくて済みます.
 */

func main() {
    var str:String?
    str = "tanaka"
    guard let name = str else {return}
    print(name) // "tanaka"
}
main()

/*:
 ## if-let
 
 値がnilであるかどうかで場合分けをしたい場合に使用します.
 
 if-let文で定義した変数はif節内のみで有効なこともポイントです.
 
 
 */

var str:String?
str = "tanaka"
if let name = str {
    print(name)
}
else {
    print("nil")
}
// print(name) nameはif節内だけで使用可能
