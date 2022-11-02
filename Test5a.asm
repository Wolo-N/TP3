
main:
    SET R0, 0xA2
    SET R1, 0x01
    SET R7, 0xFF
    PUSH |R7|, R0
    PUSH |R7|, R1
    DB 0x7F 
    DB 0x00
    POP |R7|, R1
    POP |R7|, R0
halt:
	JMP halt
