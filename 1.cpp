#include<bits/stdc++.h>
using namespace std;

int main() {
    string line;
    int position = 50;        
    int countZero = 0;        

    while (getline(cin, line)) {
        if (line.empty()) continue;

        char dir = line[0];               
        // 'L' or 'R'
        int dist = stoi(line.substr(1));

        if (dir == 'L') {
            position = (position - dist) % 100;
            if (position < 0) position += 100;
        } else if (dir == 'R') {
            position = (position + dist) % 100;
        }

        if (position == 0) {
            countZero++;
        }
    }

    cout << countZero << "\n";
    return 0;
}
