// 산술 연산자
var weight = 45
weigth += 10
weight -= 10
weight *= 10
weight /= 10
weight %= 5

// 비교 연산자
// <, >, ==, !=
let age = 27
let isAdult = age >= 20 // true
let 나이 = age == 17 // false

// 논리 연산자
// &&, ||, !
let 찌니 = age >= 3 && age <= 5 // true


////////////////////

// 조건문
// if condition {
    
// }

let dust = 15

if dust <= 30 {
    print("상쾌")
}
else if dust > 30 && dust <= 50 {
    print("보통")
}
else if dust > 50 && dust <= 100 {
    print("나쁨")
}
else {
    print("최악")
}

// switch value {
// case pattern:
//     code
// default:
//     codd
// }
let weather = "맑음"
switch weather {
case "맑음":
    print("맑음")
case "흐림":
    print("흐림")
default:
    print("구름")
}