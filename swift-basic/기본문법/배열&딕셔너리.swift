// array

let month = 3
let toDo = "Study"

var evenNumber: Array<Int> = [2,4,6,8]
var evenNumber: [Int] = [2,4,6,8]
var arr = ["Java", "Swift", "Python"] // 축약형

var arrTodo: Array<String> = ["Java", "Swift", "Python"]
arrTodo[0]
arrTodo[2] = "JavaScript"

evenNumber.append(10) // [2,4,6,8,10]
evenNumber.insert(12, at: 0) // [12,2,4,6,8,10]

evenNumber.remove(at: 0) // 12, [2,4,6,8,10]


// dictionary
var toDoList = ["10": "Play", "11": "Study"] // key,value
toDoList["12"] = "Travel"

// 삭제
toDoList.removeValue(forKey: "12")
toDoList["11"] = nil

toDoList.removeAll()

for key in toDoList.keys {
    print(key)  // key 만 출력
}

for value in toDoList.values {
    print(value) // value 만 출력
}