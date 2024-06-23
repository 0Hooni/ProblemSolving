#include <string>
#include <vector>
#include <algorithm>

using namespace std;

string solution(string s) {
    string answer = "";
    vector<int> nums;
    bool isMinus = false;
    string num = "";

    for(int i=0; i<s.size(); i++) {
        char cur = s[i];
        
        if(cur == '-') {
            isMinus = true;
            continue;
        } else if ('0' <= cur && cur <= '9') {
            num += cur;
            if(i == s.size() - 1) {
                if(isMinus) {
                nums.push_back(-stoi(num));
            } else {
                nums.push_back(stoi(num));
            }    
            }
        } else {
            if(isMinus) {
                nums.push_back(-stoi(num));
            } else {
                nums.push_back(stoi(num));
            }
            num = "";
            isMinus = false;
        }
    }
    
    sort(nums.begin(), nums.end());
    answer = to_string(nums.front()) + " " + to_string(nums.back());

    return answer;
}