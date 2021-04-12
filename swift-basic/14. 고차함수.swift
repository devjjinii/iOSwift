let numbers: [Int] = [0,1,2,3,4]
var doubledNumbers: [Int]
var strings: [String]

doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2 // [0, 2, 4, 6, 8]
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"  // ["0", "1", "2", "3", "4"]
})

doubledNumbers = numbers.map { $0 * 2 } // [0, 2, 4, 6, 8]

var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number) // [0, 2, 4]
    }
}

let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in 
    return number % 2 == 0
}

print(evenNumbers) // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0 } // [1, 3]

let someNumbers: [Int] = [2, 8, 15]
let sum: Int = someNumbers.reduce(0, {  // 초깃값이 0이고 내부의 모든값을 더함
    (first: Int, second: Int) -> Int in
    return first + second
})

print(sum) // 25

let sumFromThree = someNumbers.reduce(3) { $0 + $1 } // 초깃값이 3이고 모든값을 더함
print(sumFromThree) // 28

print(someNumbers.reduce(1) { $0 * $1 }) // 240
print(someNumbers.reduce(2) { $0 * $1 }) // 480



//========= 추가적으로

// 제네릭(Generics)
// 서브스크립트(Subscript)
// 접근수준(Access Control)
// ARC(Automatic Reference Counting)
// 중첩타입(Nested Types)
// 사용자정의 연산자(Custom Operators)
