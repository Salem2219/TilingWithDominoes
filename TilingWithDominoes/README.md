# Tiling with Dominoes

Given a 3 x n(up to 14) board, find the number of ways to fill it with 2 x 1 dominoes.


Examples :

Input : 2
Output : 3

Input : 8
Output : 153

Input : 12
Output : 2131
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to count the number of ways to fill it with 2 x 1 dominoes.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/TilingProblem.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd TilingProblem
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 7, sum = 4 then y = 5 :

    ```sh
    $ vsim work.tb
    ```
