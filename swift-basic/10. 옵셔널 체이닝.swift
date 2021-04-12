/*
* 옵셔널 체이닝
*  : 옵셔널이 연속적으로 연결되는 경우 유용하게 사용
*/

class Person {
    var name: String
    var job: String?
    var home: Apartment?  // nil 할당

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?  // 옵셔널
    var owner: Person?  // 옵셔널

    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let jin: Person? = Person(name: "jin")
let apart: Apartment? = Apartment(dong: "111", ho: "222")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝을 사용하지 않는다면,
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("직업은 \(guardJob)입니다")
                } else {
                    print("직업은 없습니다")
                }
            }
        }
    }
}

// 옵셔널 체이닝을 사용한다면
func guardJobOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("직업은 \(guardJob)입니다")
    } else {
        print("직업은 없습니다")
    }
}

// nil 병합 연산자 : ??