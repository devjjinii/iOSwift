class Person {
    var name: String = ""

    func selfIntroduce() {
        print("저는 \(name)입니다")
    }

    // 재정의 방지
    final func sayHello() {
        print("hello")
    }

    // 타입 메서드 
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }

    // 재정의 가능 
    class func classMethod() {
        print("type method - class")
    }

    // 재정의 가능한 class 메서드라도 final 키워드를 사용하면 재정의 불가능
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student: Person {
    //var name: String = ""
    var major: String = ""

    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }

    override class func classMethod() {
        print("overridden type method - class")
    }

    // static 이나 final 은 재정의 불가능!!
}

let jin: Person = Person()
let jjinii: Student = Student()
jin.name ="jin"
jjinii.name ="jjinii"



//====================================================

class PersonC {
    var name: String
    var age: Int
    var nickName: String?  // 옵셔널 사용

    // 자신을 초기화할때
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jin: PersonC = PersonC(name: "jin", age: 27)
let jjinii: PersonC = PersonC(name: "jjinii", age: 3, nickName: "jjinii")

class Puppy {
    var name: String
    var owner: PersonC!  // 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용

    init(name: String) {
        self.name = name
    }

    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let jjinii: Puppy = Puppy(name: "jjinii")
jjinii.owner = "jin"
jjinii.goOut()