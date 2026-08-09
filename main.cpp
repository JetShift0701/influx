#include <iostream>
#include <string>

#include "customclass.h"

// Eigen 5: header-only, only need to set the include directory
#include <Eigen/Dense>

int main(int argc, char* argv[]) {
    std::string name = (argc > 1) ? argv[1] : "world";
    CustomClass greeter(name);
    std::cout << greeter.greet() << std::endl;

    // ----- Eigen demo: 3x3 矩阵，求行列式 -----
    Eigen::Matrix3d A;
    A << 1, 2, 3,
         4, 5, 6,
         7, 8, 10;
    std::cout << "Matrix A:\n" << A << std::endl;
    std::cout << "det(A) = " << A.determinant() << std::endl;

    return 0;
}
