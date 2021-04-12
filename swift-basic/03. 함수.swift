// 반환값이 있는 경우
func sum(a: Int, b: Int) -> Int {   // -> 반환타입
    return a + b
}

// 반환값이 없는 경우
func print(name: String) -> Void {
    print(name)
}

func print(name: String) {
    print(name)
}

// 매개변수가 없는 함수
func maximumInteger() -> Int {
    return Int.max
}

// 매개변수와 반환값이 없는 함수
func hello() -> Void { print("hello") }
func bye() { print("bye") }

//======================================================
func greeting(friend: String, me: String = "jin") {
    print("Hello \(friend)! I'm \(me)")
}

greeting(friend: "jjinii")


// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

greeting(to: "jjinii", from: "jin")


func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

print(sayHelloToFriends(me: "jin", friends: "jjinii","tom"))
print(sayHelloToFriends(me: "jin")) // Hello []! I'm jin

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("jjinii","jin");

//==================================================================

if condition {  // swift 조건은 꼭 Boolean (true/ false)
    statements
} else if condition {
    statements
} else {
    statements
}

switch value {
    case pattern:
        code
    default:
        code
}

switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99") // 명시적으로 break 걸림
case 100:
    print("100")
    fallthrough // break 안타고 밑으로 내려감
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}
 
var integers = [1,2,3]
let people = ["jin" : 26, "jjinii" : 3]

for integer in integers {
    print(integer)
}

for (name,age) in people {
    print("\(name): \(age)")
}

while (integers.count > 1) { // true or false 만
    integers.removeLast()
}

// do-while
repeat {
    integers.removeLast() // 먼저실행
} while integers.count > 0 // 조건확인