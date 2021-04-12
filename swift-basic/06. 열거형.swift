enum Day {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var days: Day = Day.mon
day= .tue

print(day)

swith day {
    case .mon, .tue, .wed, .thu:
        print("평일")
    case Weekday.fri:
        print("불금")
    case .sat, .sun:
        print("주말")  // 하나라도 빠지면 default 구현해줘야함
}

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case mango = 2
}

print("Fruit.mango.rawValue == \(Fruit.mango.rawValue)")

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("\(School.university.rawValue)") // university

// let apple: Fruit = Fruit(rawValue: 0) // 옵셔널 타입
let apple: Fruit? = Fruit(rawValue: 0)


//========================================================================
// 값 타입 (구조체,열거형) & 참조타입 (클래스)
//========================================================================

struct SomeStruct {
    var someProperty: String = "Property"
}

var someStructInstance: SomeStruct = SomeStruct()

func someFunction(structInstance: SomeStruct) {
    var localVar: SomeStruct = structInstance
    localVar.someProperty = "ABC"
}

someFunction(someStructInstance)
print(someStructInstance.someProperty)   // Property -> 복사


class SomeClass {
    var someProperty: String = "Property"
}

var someClassInstance: SomeClass = SomeClass()

func someFunction(classInstance: SomeClass) {
    var localVar: SomeClass = classInstance
    localVar.someProperty = "ABC"
}

someFunction(someClassInstance)
print(someClassInstance.someProperty) // ABC  -> 참조값이 전달되기 때문


///////// 스위프트는 구조체, 열거형 사용을 선호
///////// Apple 프레임워크는 대부분 클래스 사용
