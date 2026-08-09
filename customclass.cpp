#include "customclass.h"

#include <utility>

CustomClass::CustomClass(std::string name)
    : name_(std::move(name)) {}

std::string CustomClass::greet() const {
    return "Hello, " + name_ + " from CustomClass!";
}
