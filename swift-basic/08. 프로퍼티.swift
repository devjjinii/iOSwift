/*
* 저장 프로퍼티
* 연산 프로퍼티
* 인스터스 프로퍼티
* 타입 프로퍼티
*/

struct Student {

    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0

    var westernAge: Int {
        get {
            return koreanAge - 1
        }

        set(inputAge) {
            koreanAge = inputAge + 1
        }
    }

    static var typeDescription: String = "학생"

    // 읽기전용 get
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }

    static var selfIntroduction: String {
        return "학생타입입니다."
    }
}

print(Student.selfIntroduction) // 학생타입입니다.

var jin: Student = Student()
jin.koreanAge = 27
jin.name = "jin"


/*
* 프로퍼티 감시자
*/

struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) { // 바뀌기 전에 호출
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")
        }

        didSet(oldRate) { // 바뀌고 호출
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.")
        }
    }

    // 프로퍼티 감시자 사용
    var dollar: Double = 0 {
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get{
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        // 프로퍼티 감시자는 사용불가능
    }
}

var money: Money = Money()
// 환율이 1100.0 에서 1150.0으로 변경될 예정입니다.
money.currencyRate = 1150 
// 환율이 1100.0 에서 1150.0으로 변경되었습니다.

// 0.0달러에서 10.0달러로 변경될 예정입니다.
money.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다.



var a: Int = 100 {
    willSet {
        print("\(a)에서 \(newValue)로 변경될 예정입니다")
    }
    didSet {
        print("\(oldValue)에서 \(a)로 변경되었습니다")
    }
}

//100 에서 200로 변경될 예정입니다
a = 200
// 100 에서 200로 변경되었습니다