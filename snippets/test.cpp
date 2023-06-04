// Your First C++ Program

#include <cstdlib>
#include <iostream>

int foo(void) { return 0; }
int main() {
  for (int i = 0; i < 5; ++i) {
    if (i != 3) {
      std::cout << "Hello World " << i << std::endl;
    }
  }

  int a = foo();
  return 0;
}
