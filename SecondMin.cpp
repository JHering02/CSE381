#include <iostream>
#include <fstream> 
using namespace std;

int main() {
    ifstream inFile;
    inFile.open("input.txt");
    if (!inFile.is_open()) {
      cout << "Could not open file numFile.txt." << endl;
      return 1; // Error 
   }
   char ch;
   int count = 0;
   while(!inFile.eof()) {
    //go through the file to find the second least int
   }
    int output;
    ofstream outFile;
    outFile.open("output.txt");
    inFile.close();
    outFile.close();
}

