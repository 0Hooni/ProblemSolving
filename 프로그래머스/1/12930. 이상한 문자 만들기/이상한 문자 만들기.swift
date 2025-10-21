import Foundation

func solution(_ s:String) -> String {
    let a = s.components(separatedBy: " ")    // "try", "hello", "world"
            .map { word in
                word.enumerated().map { (i, ch) in // "(t, 0), ... "
                    i % 2 == 0 ?
                    String(ch).uppercased() :
                    String(ch).lowercased()
                }.joined()
            }
    
    return a.joined(separator: " ")
}