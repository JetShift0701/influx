#include <iostream>
#include <string>

#include "customclass.h"

int main(int argc, char* argv[]) {
    std::string name = (argc > 1) ? argv[1] : "world";
    CustomClass greeter(name);
    std::cout << greeter.greet() << std::endl;
    return 0;
}
