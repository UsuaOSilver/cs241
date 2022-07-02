//
// as3.cpp
//
// Decoding MIPS
//

#include <cstdint>
#include <fstream>
#include <iostream>
using namespace std;

int main()
{
    uint32_t instruction;

    // Open for reading/binary
    ifstream file("mips.bin", ifstream::in | ifstream::binary);

    while(file.get(reinterpret_cast<char*>(&instruction), 4)) {
        // Decode `instruction`
        int opcode = (instruction >> 26) & 0b111111 ;

    }
}
