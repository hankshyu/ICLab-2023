#include "stdio.h"
#include <iostream>
#include <fstream>
#include <string.h>
#include <stdlib.h>
#include <iomanip>

using namespace std;

const int ADDR_START =  0x1000;
const int ADDR_END =    0x1ffe;


int main(){

    ofstream dat;
    dat.open ("DRAM_inst.dat");
    ofstream objdump;
    objdump.open("instr.objdump");

    objdump << "Disassembly of file program.asm (0x1000 ~ 0x1FFF of \"DRAM_inst.dat\")\n" <<endl;
    objdump << "00001000 <program>:" <<endl;
    
    string instr;
    string reg0, reg1, reg2;
    int int0, int1, int2, reg_value, processed_reg_value;
    int counter = 1;
    int payload;
    int addr = ADDR_START;
    unsigned char *mon;
    unsigned char *mon2;

    while(cin >> instr){
        objdump << "    " <<hex << addr << "[" << setw(4) << setfill('0') <<(addr-0x1000)/2<<"]" << setfill(' ') << ":\t" << dec;
        dat << "@" << hex << addr << endl;
        
        if((instr == "add") || (instr == "sub") || (instr == "slt") || (instr == "mul")){
            // R type instructions
            cin >> reg0 >> reg1 >> reg2;
            if(reg0[0] == 'r') reg0.erase(0,1);
            if(reg1[0] == 'r') reg1.erase(0,1);
            if(reg2[0] == 'r') reg2.erase(0,1);
            int0 = stoi(reg0);
            int1 = stoi(reg1);
            int2 = stoi(reg2);
            if((int0 < 0) || (int0 > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid register number" <<endl, exit(5); 
            if((int1 < 0) || (int1 > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid register number" <<endl, exit(5); 
            if((int2 < 0) || (int2 > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid register number" <<endl, exit(5); 

            if(instr == "add"){
                //000-rs-rt-rd-1

                payload = (0 << 13) + (int0 << 9) + (int1 << 5) + (int2 << 1) + 1;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";
                
                objdump << "add  ";
                objdump.setf(ios::left); 
                
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump << "r";
                objdump.width(3);
                objdump << int2;
                objdump.unsetf(ios::left); 

                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;

            }else if(instr == "sub"){
                // 000-rs-rt-rd-0

                payload = (0 << 13) + (int0 << 9) + (int1 << 5) + (int2 << 1) + 0;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";
                
                objdump << "sub  ";
                objdump.setf(ios::left); 
                
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump << "r";
                objdump.width(3);
                objdump << int2;
                objdump.unsetf(ios::left); 

                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;

            }else if(instr == "slt"){
                // 001-rs-rt-rd-1

                payload = (1 << 13) + (int0 << 9) + (int1 << 5) + (int2 << 1) + 1;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";
                
                objdump << "slt  ";
                objdump.setf(ios::left); 
                
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump << "r";
                objdump.width(3);
                objdump << int2;
                objdump.unsetf(ios::left); 

                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;

            }else{ // instr == mul
                //001-rs-rt-rd-0

                payload = (1 << 13) + (int0 << 9) + (int1 << 5) + (int2 << 1) + 0;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";
                
                objdump << "mul  ";
                objdump.setf(ios::left); 
                
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump << "r";
                objdump.width(3);
                objdump << int2;
                objdump.unsetf(ios::left); 

                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;

            }

        }else if((instr == "lw") || (instr == "sw") || (instr == "beq")){
            // I type instructions
            cin >> reg0 >> reg1 >> reg_value;
            if(reg0[0] == 'r') reg0.erase(0,1);
            if(reg1[0] == 'r') reg1.erase(0,1);
            int0 = stoi(reg0);
            int1 = stoi(reg1);
            if((int0 < 0) || (int0 > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid register number" <<endl, exit(5); 
            if((int1 < 0) || (int1 > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid register number" <<endl, exit(5); 
            if((reg_value < -16) || (reg_value > 15)) cerr <<"Instruction "<< counter <<": "<<"invalid imm value" <<endl, exit(5);

            if(instr == "lw"){
                //011-rs-rt-iiiii

                mon2 = (unsigned char*)(&reg_value);
                processed_reg_value = (((int)*(mon2)) & 31);

                payload = (3 << 13) + (int0 << 9) + (int1 << 5) + processed_reg_value;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";
                
                objdump << "lw   ";
                objdump.setf(ios::left); 
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump.unsetf(ios::left); 
                objdump.width(3);
                objdump  << reg_value;
                
                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;

            }else if(instr == "sw"){
                // 010-rs-rt-iiiii
                mon2 = (unsigned char*)(&reg_value);
                processed_reg_value = (((int)*(mon2)) & 31);

                payload = (2 << 13) + (int0 << 9) + (int1 << 5) + processed_reg_value;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";

                objdump << "sw   ";
                objdump.setf(ios::left); 
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump.unsetf(ios::left); 
                objdump.width(3);
                objdump  << reg_value;

                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;
            }else{ // instr == "beq"
                // 101-rs-rt-iiiii
                mon2 = (unsigned char*)(&reg_value);
                processed_reg_value = (((int)*(mon2)) & 31);

                payload = (5 << 13) + (int0 << 9) + (int1 << 5) + processed_reg_value;
                mon = (unsigned char*)(&payload);

                objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
                objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";

                objdump << "beq  ";
                objdump.setf(ios::left); 
                objdump << "r";
                objdump.width(3);
                objdump << int0;
                objdump << "r";
                objdump.width(3);
                objdump << int1;
                objdump.unsetf(ios::left); 
                objdump.width(3);
                objdump  << reg_value;
                
                dat << hex << setw(2) << setfill('0') << (int)*(mon);
                dat << " ";
                dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;
            }

        }else if(instr == "j"){
            //100-address
            cin >> hex >> reg_value >> dec;
            if((reg_value < 0x1000) || (reg_value > 0x1FFF)) cerr <<"Instruction "<< counter <<": "<<"invalid jump addr" <<endl, exit(5);

            payload = reg_value | 0x8000;

            mon = (unsigned char*)(&payload);

            objdump << hex << setw(2) << setfill('0') << (int)*(mon + 1) << " " ;
            objdump << setw(2) << setfill('0') << (int)*(mon) << dec << setfill(' ') << "\t\t";

            objdump << "j    "<< hex << setfill('0') << setw(4) << reg_value << " [" << setw(4) << (reg_value-0x1000)/2 <<"]" << setfill(' ') <<dec;

            dat << hex << setw(2) << setfill('0') << (int)*(mon);
            dat << " ";
            dat << setw(2) <<(int)*(mon + 1) << dec << setfill(' ') << endl;


        }else{
            cerr << "unsupport instruction type: "<< instr << endl;
            exit(4);
        }
        objdump << endl;
        counter++;
        addr += 0x2;
    }

    //fill up dat file
    while (addr <= ADDR_END){
        dat << "@" << hex << addr << endl;
        dat << "00 90"<<endl; // j 0x1000
        addr += 2;
    }
    
    dat.close();
    objdump.close();
}
