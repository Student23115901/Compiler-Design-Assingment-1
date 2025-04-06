Compiler Design Assignment-1 | Roll No. - 23115901 | Name - Anushk Singh | CSE 4th Semester

# 🧮 Custom Instruction Lexer — `custom_operation`

This project demonstrates a simple compiler-like behavior using **Flex** and **C**, focusing on parsing a custom instruction from user input and evaluating the expression:

x² + y² - 2xy


The program is built using `Flex`, `GCC`, and `Make` on the **MSYS2** platform for Windows.

---

## 🎯 Project Aim

The primary objective of this project is to implement a lexical analyzer that:
- Identifies structured user input in the format: `x<value> y<value> custom_operation`
- Recognizes each token (`x`, `y`, and `custom_operation`)
- Extracts values from tokens
- Evaluates the expression `x² + y² - 2xy`
- Prints the result

This simulation demonstrates how a basic lexer can be used to create custom compiler instructions.

---

## 🛠️ Required Software

To run and build this project successfully, the following software must be installed:

### 1. **MSYS2**
A Unix-like shell and package manager for Windows.

📦 Download: https://www.msys2.org

After installation:

pacman -Syu               # Update everything (only needed once)

Then, install the development tools:

pacman -S gcc flex make   # Install GCC, Flex, and Make
2. Flex
A tool for generating lexical analyzers. Required to process the .l file that defines patterns for x, y, and custom_operation.

3. GCC
The GNU Compiler Collection — compiles your C code into an executable.

4. Make
Automates the build process using the Makefile.

**How to run the program :**

How to Run
✅ Install MSYS2 from https://www.msys2.org

✅ Open MSYS2 MSYS terminal

✅ Install required packages:
pacman -Syu (then restart terminal if prompted)
pacman -S gcc make flex

✅ Navigate to the project directory:
cd /c/Users/Dell/Desktop/custom-operation-project

✅ Build the project:
make

✅ Run the program:
./custom_op

✅ Enter input like:
x3 y5 custom_operation

✅ Get output of the expression:
x² + y² - 2xy

Sample Output : 
Token: XVAL (x=3.00)
Token: YVAL (y=5.00)
Token: CUSTOM_OPERATION
Result of custom_operation (x² + y² - 2xy): 4.00
