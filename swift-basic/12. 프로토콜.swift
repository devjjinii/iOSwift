/*
* 프로토콜 
*/

protocol Talkable {

    // 프로퍼티 요구는 항상 var 키워드 사용
    var topic: String { get set }
    var language: String { get }

    func talk() // 메서드

    init(topic: String, language: String) // 이니셜라이저
}

struct Person: Talkable {
    var topic: String
    let language: String

    //var language: String { return "한국어" }

    func talk() {}

    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}


/*
* 프로토콜 상속 : 다중상속 가능
* protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
*  // ...
* }
*/ 

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    // func read()
    func speak()
}



//=============================================

/*
* 익스텐션
*/

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true

extension String {
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }

    init(doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

let stirngFormInt: String = String(intTypeNumber: 100) // 100