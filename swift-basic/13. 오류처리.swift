enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}


enum vendingMachine {
    case itemPrice: Int = 100
    case itemCount: Int = 5
    var deposited: Int = 0

    func receiveMoney(_ money: Int) throws {

        guard money > 0 else {  // 입력한 돈이 0 이하면 오류를 던진다
            throw VendingMachineError.invalidInput
        }

        self.deposited += money
        print("\(money)원 받음")
    }

    func vend(numberOfItems numberOfItemsToVend: Int) thorws -> String {

        guard numberOfItemsToVend > 0 else {
            throws VendingMachineError.invalidInput
        }   

        guard numberofItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited

            throw VendingMachineError.insufficientFunds(moneyNeeded: money)
        }

        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }

        let totalPrice = numberOfItemsToVend * itemPrice

        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend

        return "\(numberOfItemsToVend)개 제공함"
    }

}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?


do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
}

do {
    try machine.receiveMoney(300)
} catch(let errorA) {
    switch {
        // ..................
    }
}

do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}

// try? : 별도의 오류처리 결과를 통보받지 않음 / 오류 발생 후 결과값을 nil 로
result = try? machine.vend(numberOfItems: 2)

// try! : 정상동작 후 바로 결과값을 받음 / 오류 발생 시 런타임 오류 발생 
result = try! machine.vend(numberOfItems: 1)

