class Circle {
    var radius = 10.0
    let pi = 3.1415926635

    init() {
        radius = 10.0
    }

    init(radius : Double) {
        self.radius = radius
    }

    func area() -> Double {
        return radius * radius * pi
    }
}

let circle = Circle() // 인스턴스 생성
circle.area() // 314.15926635

let circle = Cricle.init(radius: 20)
circle.area() // 1256.6370614


// swift 문서에서는 객체 or Object 대신 인스턴스라고 명칭하라고 함.

