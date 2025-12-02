#include <bits/stdc++.h>
using namespace std;

int main(){
    int p=50, z=0; 
    string s;

    while (cin >> s) {
        int d = stoi(s.substr(1));
        int dir = (s[0]=='L' ? -1 : 1);

        for (int i=0; i<d; i++) {
            p = (p + dir + 100) % 100;
            if (p == 0) 
              z++;
        }
    }
    cout << z;
}
