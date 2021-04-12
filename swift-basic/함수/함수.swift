func hello(name: String) -> String {
    return "Hello " + name
}

let message = hello(name: "jin")


func add(num1: Int, num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}

func addNumbers(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1,2,3,4,5)

func myInfo() -> (name: String, age: Int) {
    return ("jin", 27)
}

let info = myInfo()
print(info.name)

// print 시 terminator: "" (\n 제거)


///////////////////////////////////////////////
func calculate(_ num1: Int, SecondNumber num2: Int) -> Int {
    return num1 * num2 
}

calculate(num1: Int, SecondNumber: Int)
calculate(10, SecondNumber: 10)

//// inout 키워드

func addTwoNumber(num1: Int, num2: inout Int) -> Int {
    num2 = 7 // 값 변경을 위해 inout 사용
    return num1 + num2
}

var test1 = 1
var test2 = 2

addTwoNumber(num1: test1, num2: &test2)
print(test2) // 7 test2 자제가 넘어옴

// 복사해서 전달 (값)
// 변수자체를 전달 (참조) - 메모리 주소