#include <bits/stdc++.h>
using namespace std;
int main() {
    int p = 50, z = 0, d;
    string s;
    while (cin >> s) {
        d = stoi(s.substr(1));
        if (s[0] == 'L') 
            p = (p - d % 100 + 100) % 100;
        else 
            p = (p + d) % 100;
        if (!p) 
            z++;
    }
    cout << z;
}
