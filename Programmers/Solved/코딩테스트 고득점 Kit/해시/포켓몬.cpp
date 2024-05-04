#include <vector>
#include <algorithm>
#include <unordered_set>

using namespace std;

int solution(vector<int> nums)
{
    int answer = nums.size()/2;
    vector<int> pk;

    for(auto n:nums) {
        // 종류에서 찾을 수 없으면 추가
        if(find(pk.begin(), pk.end(), n) == pk.end()) 
            pk.push_back(n);
    }
    answer = answer < pk.size() ? answer : pk.size();
    
    return answer;
}

// 배열 중복을 제거함
// 제거한 후 사이즈 > 절반 크기 -> 절반 출력
// 그 반대라면 제거 후 사이즈 출력

// 다른 풀이
int solution(vector<int> nums) {
    unordered_set<int> s(nums.begin(), nums.end());

    return min(nums.size() / 2, s.size());
}