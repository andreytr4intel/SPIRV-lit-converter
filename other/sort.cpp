#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <cstdio>

using namespace std;

int main(int argc, char *argv[]) {
    if (argc < 2) {
        cerr << "Not enough parameters" << endl;
        cerr << "Usage:" << endl << argv[0] << " <file.txt>" << endl;
        cerr << "Author:" << endl << "Written by Andrey Tretyakov (Intel, 2022)" << endl;
        return 1;
    }

    ifstream input(argv[1]);
    if (input) {
        vector<pair<string, string> > A;
        map<string, unsigned> M;
        string s;
        while (getline(input, s)) {
            auto s0 = s;
            auto p = s0.find(':');
            if (p != string::npos)
                s0 = s0.substr(0, p);
//            cout << s0 << endl;
            A.push_back(make_pair(s, s0));
            M[s0]++;
        }
//        for (const auto &i : A)
//            cout << i.first << endl;
        sort(A.begin(), A.end(), [&M] (const pair<string, string> &a, const pair <string, string> &b) {
            if (a.second == b.second || M[a.second] == M[b.second])
                return a.first < b.first;
            return M[a.second] > M[b.second];
        });
        for (const auto &i : A)
            cout << i.first << endl;
    } else
        perror((string("ifstream(") + argv[1] + ")").c_str());
    return 0;
}
