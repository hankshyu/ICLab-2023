#include <stdio.h>
#include <stdlib.h>

const unsigned int SEED = 917;
const int PRINTINFO = 0;
const int PRINTDRAM = 0;
const int PRINTDATA = 1;

int rrandom(int lower, int upper){
    return (rand() % (upper - lower + 1)) + lower;
}

int main(){
    // srand(SEED);
    int address = 0x10000;

    for(int user = 0; user < 256; user++){
        int large_item = rrandom(0, 63);
        int medium_item = rrandom(0, 63);
        int small_item = rrandom(0, 63);
        int user_lv = rrandom(0,9);
        int user_exp;
        //restrictions on user_lv


        if(user_lv <= 3){
            user_lv = 3;
            user_exp = rrandom(0, 1000);
        } else if(user_lv <= 6){
            user_lv = 2;
            user_exp = rrandom(0, 2500);
        }else if(user_lv <= 8){
            user_lv = 1;
            user_exp = rrandom(0, 4000);
        }else{
            user_lv = 0;
            user_exp = 0;
        }

        user_exp -= (user_exp % 20);

        int p1 = large_item*4 + medium_item/16;
        int p2 = (medium_item % 16)*16 + small_item/4;
        int p3 = (small_item%4)*64 + user_lv*16 + user_exp/256;
        int p4 = user_exp %256;
        if(PRINTDRAM)printf("@%5x\n", address);
        if(PRINTDRAM)printf("%02x %02x %02x %02x\n", p1, p2, p3, p4);


        int cash = rrandom(0, 65565);
        int item_id = rrandom(1,3);
        int item_num = rrandom(1, 63); // at least buy one
        int seller_id = rrandom(0, 255);
        while(seller_id == user){
            seller_id = rrandom(0, 255);
        }
        int p5 = cash / 256;
        int p6 = cash % 256;
        int p7 = item_id*64 + item_num;
        int p8 = seller_id;
        if(PRINTDRAM)printf("@%5x\n", address + 0x4);
        if(PRINTDRAM)printf("%02x %02x %02x %02x\n", p5, p6, p7, p8);

        if(PRINTINFO){
            printf("(L,M, S) = (%d, %d, %d)\t,lv = %1d, user_exp = %04d\n",large_item,medium_item,small_item,user_lv, user_exp);
            printf("Money : %d, item id : %d, num: %d, seller ID: %d\n",cash , item_id, item_num, seller_id);
        }
        address += 0x8;
        if(PRINTDATA){
            printf("%d %d %d %d %d\n", large_item, medium_item, small_item, user_lv, user_exp);
            printf("%d %d %d %d\n", cash , item_id, item_num, seller_id);
        }
    }
    //while(address != (0x2FFFC + 0x4)){
    //    printf("@%5x\n", address);
    //    printf("00 00 00 00\n");
    //    address += 0x4;
    //}
}
