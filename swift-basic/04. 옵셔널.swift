/*
* Optional : 값이 있을 수도 없을 수도 있음
*  - nil의 가능성을 명시적으로 표현
*/

let optioanlConstant: Int? = nil
let someConstant: Int = nil // 오류 발생

func someFunction(someOptionalParam: Int?) {

} 

func someFunction(someParam: Int) {

}

someFuntcion(someOptionalParam: nil) // -- o
someFunction(somePara: nil) // -- x

// ? ! 

// ! : 암시적 추출 옵셔널
var optionalValue: Int! = 100

switch optionalValue {
    case .none:
        print("nil")
    case .some(let value):
        print("\(value)")
}

var optionalValue: Int? = 100 // 기존변수처럼 사용 불가능
optionalValue = optionalValue + 1  // -- x


/*
* Optional Binding : nil 체크 + 안전한 값 추출
* Force Unwrapping : 옵셔널 값을 강제로 추출 (!)
*/
