/*
* 문자열 보간법 (String Interpolation) 
*    : \(변수나 상수) 의 형태로 표기하면 이를 문자열로 치환
*/

let name: String = "yujin"
print("My name is \(name)")  // My name is yujin



// 상수 let & 변수 var 
let 이름: 타입 = 값
var 이름: 타입 = 값

// 타입이 명확하면 생략 가능
let 이름 = 값
var 이름 = 값

let constant: String = "변경 불가능한 상수"
var variable: String = "변경 가능한 변수"

let sum : Int
let inputA: Int = 100
let inputB: Int = 200

sum = inputA + inputB  // sum 은 이 이후에 변경 불가능


/* Swift 의 기본 데이터 타입
* Bool, Int, UInt, Float, Double, Character, String
*        // 양의정수 //32비트 //64비트 //유니코드
*/

var testBool: Bool = true
testBool = false

var testCharacter: Character = "A"
testCharacter = "문자열 Type은 안됨" // 오류

/*
* Any, AnyObject, nil (없음)
*  Any : Swift 의 모든 타입을 지칭하는 키워드
*  AnyObject : 모든 클래스타입을 지칭하는 프로토콜
*  nil : 없음을 의미하는 키워드
*/

var someAny: Any = 100
someAny = "모든 타입 가능"
someAny = 123.123

// let someDouble: Double = somAny  // 오류

class SomeClass {}

var someAnyObject: AnyObject = SomeClass()
// someAnyObject = 123.123 // 오류

// someAny = nil // 오류 : 빈값은 불가능
// SomeAnyObject = nil // 오류 : 빈값은 불가능


