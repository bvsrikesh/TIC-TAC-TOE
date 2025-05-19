This project involves building a modular simulation of a two-player Tic-Tac-Toe game. It does not include AI or an automated opponent — instead, it tracks and enforces moves between two human players. The game state is updated after each move, and the system checks for a win or draw condition after every turn.

🧩 Modules Implemented TCell Module

Models a single cell on the 3x3 board.

Takes inputs such as clk, set, reset, and the symbol (X or O).

Outputs the valid status (whether the cell is filled) and the current symbol.

Features:

Synchronous reset and set

Cell cannot be overwritten unless reset

Prioritizes reset over set

TBox Module

Represents the complete 3x3 board using 9 instances of TCell.

Accepts player moves via row and column inputs (2-bit each).

Tracks which player’s turn it is, manages symbol assignment (X starts first), and halts updates after a win or draw.

Outputs:

valid[8:0]: Indicates filled cells

symbol[8:0]: Stores symbols in each cell

game_state[1:0]: Encodes current game status — ongoing, win, or draw

🕹 Game Rules Enforced Player X always starts first.

Moves are ignored once the game ends (win or draw) until a reset is issued.

Win and draw detection logic integrated within the module.

Only valid board positions (1-based index) are accepted.
[TIC-TAC-TOE.pdf](https://github.com/user-attachments/files/20297959/TIC-TAC-TOE.pdf)
