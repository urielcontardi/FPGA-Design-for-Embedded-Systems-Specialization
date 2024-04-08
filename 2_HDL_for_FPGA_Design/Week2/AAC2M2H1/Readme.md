# Mission 2-005

Problem 4: Design a simple ALU. This assignment is required. Students must earn at least 70% of the points possible to pass the assignment.

The inputs are 2 32-bit registers, A and B, and a 3-bit opcode. The output is a 32-bit register Y. The opcode controls ALU functions as follows:

| Opcode | Operation       | Function      |
|--------|-----------------|---------------|
| 000    | Y <= A          | A             |
| 001    | Y <= A + B      | Add           |
| 010    | Y <= A - B      | Subtract      |
| 011    | Y <= A AND B    | AND           |
| 100    | Y <= A OR B     | OR            |
| 101    | Y <= A + 1      | Increment A   |
| 110    | Y <= A - 1      | Decrement A   |
| 111    | Y <= B          | B             |
