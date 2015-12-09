import Foundation
import UIKit

//protocol Updatable {
//    var s: String { get }
//    mutating func changeValue();
//}
//
//struct UpdateMe: Updatable {
//    var s: String
//    mutating func changeValue() {
//        self.s = "changed"
//    }
//}
//
//func functionThatUpdates(var param: Updatable) {
//    param.changeValue()
//    print("in func: \(param.s)")
//}
//
//var update = UpdateMe(s: "initial")
//var update2: Updatable = update
//var update3: Updatable = update2
//functionThatUpdates(update2)
//print("upd: \(update.s)")
//print("upd2: \(update2.s)")
//print("upd3: \(update3.s)")

//////////////////////////
//////////////////////////
//////////////////////////

//func myCompare<T: Equatable>(lhs: T, rhs: T) -> Bool {
//    return lhs == rhs
//}
//
//print("same? \(myCompare(9, rhs: 18/2))")

//////////////////////////
//////////////////////////
//////////////////////////

//protocol Clearable {
//    mutating func removeAll(keepCapacity keepCapacity: Bool)
//    mutating func removeRange(range: Range<Int>)
//}
//
//extension Array: Clearable { }
//
//extension String: Clearable {
//    mutating func removeRange(range: Range<Int>) {
//        let indexRange = self.startIndex.advancedBy(range.startIndex) ..< self.startIndex.advancedBy(range.endIndex)
//        self.removeRange(indexRange)
//    }
//}
//
//var ra = [1,2,3]
//var s = "hello"
//
//var v: Clearable = ra
//v.removeRange(1..<3)
//print("v after range: \(v)")
//v.removeAll(keepCapacity: true)
//print("v after all: \(v)")

//////////////////////////
//////////////////////////
//////////////////////////

//protocol Accumulator {
//    func+=(inout lhs: Self, rhs: Self)
//    init()
//}
//
//extension Int: Accumulator {}
//extension Double: Accumulator {}
//extension String: Accumulator {}
//
//extension SequenceType {
//    func FancySum<U: Accumulator>(selector: (Generator.Element)->U) -> U {
//        var result = U()
//        for v in self {
//            result += selector(v)
//        }
//        return result;
//    }
//}
//
//
//struct Test {
//    var s: String
//    init(s: String) {
//        self.s = s
//    }
//}
//
//var l = [Test(s: "One"), Test(s: "Two"), Test(s: "Three")]
//var sum = l.FancySum { (t) in
//    return t.s.characters.count
//}
//
//print(sum)

//////////////////////////
//////////////////////////
//////////////////////////


//extension SequenceType where Generator.Element: Accumulator {
//    func Sum() -> Generator.Element {
//        var result = Generator.Element()
//        for v in self {
//            result += v
//        }
//        return result
//    }
//}
//
//let l2 = [7, 8, 9]
//let result = l2.Sum()
//print(result)



//////////////////////////
//////////////////////////
//////////////////////////


//protocol Ring {
//    static var zero: Self { get }
//    static var one: Self { get }
//    func +(lhs: Self, rhs: Self) -> Self
//    func *(lhs: Self, rhs: Self) -> Self
//    prefix func-(lhs: Self) -> Self
//}
//
//extension Int: Ring {
//    static var zero: Int { get { return 0 } }
//    static var one: Int { get { return 1 } }
//}
//
//
//extension SequenceType where Generator.Element: Ring {
//    var sum: Generator.Element {
//        return self.reduce(Generator.Element.zero, combine: +)
//    }
//    var product: Generator.Element {
//        return self.reduce(Generator.Element.one, combine: *)
//    }
//}
//
//(1...5).product


//////////////////////////
//////////////////////////
//////////////////////////

//protocol Deserializable {
//    static func deserialize(json: JSONDictionary) -> Self?
//}
//
//struct User: Deserializable {
//    var name: String
//    var rank: String
//    var serial: String
//    
//    static func deserialize(jsonDict: JSONDictionary) -> User? {
//        var result: User? = nil
//        if let name = jsonDict["name"] as? String,
//            let rank = jsonDict["rank"] as? String,
//            let serial = jsonDict["serial"] as? String {
//            result = User(name: name, rank: rank, serial: serial)
//        }
//        return result
//    }
//}
//
//extension SequenceType where Generator.Element == JSONDictionary {
//    func deserialize<T : Deserializable>() -> [T] {
//        return self.map { T.deserialize($0) }
//            .filter { $0 != nil }
//            .map { $0! }
//    
//    }
//}
//
//let jsonArray = GetUsersAsJSON()
//var items: [User] = jsonArray.deserialize()
//
//print(items.count)
//print(items[0])
//print(items[1])
//print(items[2])
