#include <string>
#include <vector>

using namespace std;

string solution(vector<string> cards1, vector<string> cards2, vector<string> goal) {
    bool flag = false;

    for(auto word:goal) {
        if(cards1.front() == word) {
            flag = true;
            cards1.erase(cards1.begin());
        } else if(cards2.front() == word) {
            flag = true;
            cards2.erase(cards2.begin());
        } else {
            flag = false;
            break;
        }
    }

    return flag ? "Yes" : "No";
}