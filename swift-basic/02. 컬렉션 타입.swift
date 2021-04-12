/*
* 컬렉션 타입 (Array, Dictionary, Set)
*  Array : 순서가 있는 리스트 컬렉션
*  Dictionary : 키와 값의 쌍으로 이루어진 컬렉션
*  Set : 순서가 없고 멤버가 유일한 컬렉션
*/

var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)

integers.contains(100)
integers.contains(99)

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

integers.count

//integers[0] -- 오류

var doubles: Array<Double> = [Double]()

var strings: [String] = [String]()

var characters: [Character] = []

let immutableArray = [1,2,3] // 변경 불가능 Array
// immutableArray.append() -- 오류
// immutableArray.removeAll() -- 오류

var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

anyDictionary["someKey"] = "dictionary" // ["someKey" : "dictionary", "anotherKey" : 100]

anyDictionary.removeValue(forKey: "anotherKey") // 100
anyDictionary["someKey"] = nil // [:]

let emptyDictionary: [String: String] = [:]

var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1) // true
integerSet.insert(100) // true
integerSet.insert(99) // true
integerSet.insert(99) // false
integerSet.insert(99) // false   --> 중복된 값이 없다는 보장 Set

integerSet // {100,99,1}
integerSet.contains(1) // true
integerSEt.contains(2) // false

let setA: Set<Int> = [1,2,3,4,5] // {5,2,3,1,4}
let setB: Set<Int> = [3,4,5,6,7] // {5,6,7,3,4}

let union: Set<Int> = setA.union(setB) // {2,4,5,6,7,3,1}
let sortedUnion : [Int] = union.sorted()  // [1,2,3,4,5,6,7]
let intersection: Set<Int> = setA.intersection(setB) // {5,3,4}
let subtracting: Set<Int> = setA.subtracting(setB) // {2,1}


