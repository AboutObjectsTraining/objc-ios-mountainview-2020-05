#include "ANSICBasics.h"
#include "Pointers.h"


void MessWithPointers() {
    char name[] = "Fred Smith";
    char *charRef = name;    
    
//    name += 5;
    
    printf("address is %p, value is %c\n", charRef, charRef[0]);
    printf("address is %p, value is %c\n", name, *name);

    printf("address is %p, value is %c\n", &charRef[1], charRef[1]);
    printf("address is %p, value is %c\n", name + 1, *(name + 1));
    
    charRef += 5;
    
    printf("address is %p, value is %s\n", charRef, charRef);
    printf("address is %p, value is %s\n", name, name);
}

int main(int argc, const char *argv[])
{
    MessWithPointers();
//    RunANSICBasics01();
//    RunANSICBasics02();
//
//    RunPointers01();
//    RunPointers02();
//    RunPointers03();
//    RunPointers04();
//    RunPointers05();

    return 0;
}

