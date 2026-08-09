#pragma once
#ifndef __CustomClass__
#define __CustomClass__

#include <string>

// A simple class that holds a name and produces a greeting.
class CustomClass {
public:
    // Explicit constructor: prevent implicit conversion from std::string.
    explicit CustomClass(std::string name);

    // Const member: does not modify object state.
    std::string greet() const;

private:
    std::string name_;
};
