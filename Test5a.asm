; 01111 111 011 00000
main:
    SET R0, 0xA2
    SET R1, 0x01
    SET R7, 0xFF
    PUSH |R7|, R0
    PUSH |R7|, R1
    ; POPADD |R7|, R3
    DB 0x7F
    DB 0x60

halt:
	JMP halt
