// Your First C++ Program

#include <cstdlib>
#include <iostream>

int foo(void) { return 0; }
int main() {
  for (int i = 0; i < 5; ++i) {
    if (i != 3) {
      int a = foo();
      std::cout << " Hello World " << i << std::endl;
    }
  }

  return 0;
}
