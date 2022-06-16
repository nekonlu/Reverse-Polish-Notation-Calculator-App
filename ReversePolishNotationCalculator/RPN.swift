import Foundation

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get } // { get }はgetter処理の実装を必須とする
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element: Comparable>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

func rpn(_ input: [String]) -> Int? {
    func calcurationString(_ o: String, _ a: String, _ b: String) -> Int {
        
        switch o{
        case "+":
            return Int(b)! + Int(a)!
        case "-":
            return Int(b)! - Int(a)!
        case "*":
            return Int(b)! * Int(a)!
        case "/":
            return Int(b)! / Int(a)!
        default:
            return 0
        }
    }
    
    // 入力時は配列に成形される
    var stack = Stack<String>()
    var acc: Int = 0
    var stackLength: Int = 0
    
    
    
    for i in input {
        
        stack.push(item: i)
        stackLength = stack.count
        if((i == "+" || i == "-" || i == "*" || i == "/") && (stackLength >= 3)) {
            acc = calcurationString(stack.pop(), stack.pop(), stack.pop())
            stack.push(item: String(acc))
        }
    }
    
    if(stack.count == 1) {
        return Int(stack.pop())
    } else {
        return nil
    }
    
}

func arrayToString(_ array: [String]) -> String {
    var ans: String = ""
    for i in array {
        ans += " " + i
    }
    return ans
}
