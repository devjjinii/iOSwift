/*
* 구조체
*/

struct Sample {
    var mutableProperty: Int = 100 // 가변
    let immutableProperty: Int = 100 //불변

    static var typeProperty: Int = 100 // 타입

    func instanceMethod() {
        print("instance method")
    }

    static func typeMethod() {
        print("tpe method")
    }
}

var mutable: Sample = Sample() // 가변
mutable.mutableProperty = 200 // -- o
// mutable.immutableProperty = 200 // -- x

Sample.typeProperty = 300
Sample.typeMethod()


// 클래스 ===================================
struct Sample {
    var mutableProperty: Int = 100 // 가변
    let immutableProperty: Int = 100 //불변

    static var typeProperty: Int = 100 // 타입

    func instanceMethod() {
        print("instance method")
    }

    // 타입 메서드
    // 재정의 불가능 타입 메서드 - statc
    static func typeMethod() {
        print("type method - static")
    }

    // 재정의 가능 타입 메서드 - class
    class func classTypeMethod() {
        print("class method - class")
    }
}

class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    class func selfIntroduce() {
        print("학생 타입")
    }

    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var jin: Student = Student()
jin.name = "jin"
jin.class = "스위프트"
jin.selfIntroduce()


