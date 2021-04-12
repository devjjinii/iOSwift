/* 클로저
* 
*  { (매개변수 목록) -> 반환타입 in 
*     실행 코드
*
*  } */

func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2) //3

var sum: (Int, Int) -> Int { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(1,2)
print(sumResult) // 3

sum = sumFunction(a:b:)
sumResult = sum(1,2)
print(sumResult) // 3


// 함수의 전달인자로서의 클로저
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in   // 클로저
    return a + b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int{
    return method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated) // 60

var result: Int                     // 후행 클로저
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in 
    return left + right
}
                                    // 반환타입 생략
result = calculate(a: 10, b: 10) { (left: Int, right: Int)  in 
    return left + right
}
                                    // 단축 인자이름
result = calculate(a: 10, b: 10, method: {
    return $0 + $1
})
                                    // 암시적 반환 표현 -- return 생략 가능
result = calculate(a: 10, b: 10) {
    $0 + $1
}

print(result) // 20


