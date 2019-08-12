enum Weekday {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var name:String { // computed propertyも持てる
        switch self {
        case .sunday:
            return "日"
        case .monday:
            return "月"
        case .tuesday:
            return "火"
        case .wednesday:
            return "水"
        case .thursday:
            return "木"
        case .friday:
            return "金"
        case .saturday:
            return "土"
        }
    }
    
    init?(japaneseName:String) { // イニシャライザも持てる
        switch japaneseName {
        case "月":
            self = .monday
        case "火":
            self = .tuesday
        case "水":
            self = .wednesday
        case "木":
            self = .thursday
        case "金":
            self = .friday
        case "土":
            self = .saturday
        case "日":
            self = .sunday
        default: // どれにも該当しなかった場合
            return nil
        }
    }
}

let day1 = Weekday.sunday
let day2:Weekday = .wednesday // 型がわかっている場合は省略可能
let day3 = Weekday(japaneseName: "月")! // イニシャライザを使用した初期化

print(day2.name)

switch day2 {
// switch文で分岐処理を行う場合は網羅性チェックをしてくれる
case .sunday:
    print("日")
case .monday:
    print("月")
case .tuesday:
    print("火")
case .wednesday:
    print("水")
case .thursday:
    print("木")
case .friday:
    print("金")
case .saturday:
    print("土")
}

enum BloodType:Int {
    case ab = 0 // 他のケースは自動的に連番が振られる
    case a
    case b
    case o
}

let bloodType:BloodType = .b
print(bloodType.rawValue) // 2

var tuple:(Int, String) // タプルを定義
tuple = (100, "hoge")
print(tuple.0) // 0番目の要素にアクセス(100)

let profile:(name:String, age:Int) = (name:"tanaka", age:25)
print(profile.name)

class Hoge {
    private func sayHello() {
        print("hello")
    }
    func hello() {
        self.sayHello()
    }
}

let ins = Hoge()
ins.hello() // "hello"

class Test {
    static let name = "tanaka"
    static func sayHello() {
        print("hello!")
    }
}

print(Test.name)
Test.sayHello()
