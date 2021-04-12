/*
* 타입캐스팅
*/

let someInt: Int = 100
let someDouble: Double = Double(someInt)

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교")
    }
}

var jin: Person = Person()

var result: Bool
result = jin is Person // true


//=================================================

/*
* assert & guard
* assert : 디버깅 모드에서 동작
* guard : early exit 사용 ( 빠른 종료 )
*/
var someInt: Int = 0

assert(someInt == 0 , "someInt != 0")
someInt = 1 

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")

    assert((age! >= 0 && (age! <= 130), "나이값 입력이 잘못되었습니다"))
    print("당신의 나이는 \(age!)세 입니다")
}

functionWithAssert(age: 27)


func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age,   // guard else
        unwrappedAge < 130,
        unwrappedAge >= 0 else {
            print("나이값 입력이 잘못되었습니다")
            return
        }

    guard unwrappedAge < 100 else {
        return
    }

    print("당신의 나이는 \(unwrappedAge)세 입니다")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }

    guard let age = info["age"] as? Int, age >= 0 else {  // 그렇지 않으면 return
        return
    }

    print("\(name): \(age)")
}
