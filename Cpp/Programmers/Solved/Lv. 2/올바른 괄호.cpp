#include <string>
#include <iostream>
#include <vector>

using namespace std;

bool solution(string s) {
    bool answer = true;
    string st = "";

    for(auto ch:s) {
        if(ch == ')' && st.back() == '(')
            st.pop_back();
        else
            st.push_back(ch);
    }

    answer = st.empty();

    return answer;
}