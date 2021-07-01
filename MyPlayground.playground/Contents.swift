//import UIKit
//
//var greeting = "Hello, playground"
//
//struct User {
//    var name: String
//}
//
//class UserRepository {
//    var user: User
//
//    init(user: User) {
//        self.user = user
//    }
//}
//
//var A = UserRepository(user: User(name: "AA"))
//var B = A
//B.user.name = "Yoshida"
//
//print(A.user.name)
//print(B.user.name)
//
//
//var C = UserRepository(user: User(name: "BB"))
//var D = C
//B = D
//
//print(A.user.name)
//print(B.user.name)
//print(C.user.name)
//print(D.user.name)


var aa = 0
func plusA(_ a: Int) {
    a += 10
}
plusA(aa)
print(aa) // 0
