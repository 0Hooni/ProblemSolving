class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let n = haystack.count
        let m = needle.count

        guard n >= m else { return -1 }
        
        let hayChars = Array(haystack)
        let needleChars = Array(needle)

        for i in 0...(n-m) {
            var match = true

            for j in 0..<m {
                if hayChars[i + j] != needleChars[j] { 
                    match = false
                    break
                }
            }

            if match { return i }
        }
        return -1
    }
}