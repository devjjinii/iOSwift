// 반복문
for i in 1...10 {
    print(i)
}

for i in stride(from: 1, to: 10, by: 2) {
    print(i) // 1,3,5,7,9
}

for j in 2...9 {
    for i in 1...9 {
        print("\(j * i)")  // 구구단
    }
}

var i = 0
while i < 10 {
    i += 1
    print(i)
}

i = 0
repeat {
    i += 1
    print(i)
} while i < 10