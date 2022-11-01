;Escribir la funcion mft3 que calcula dos expresiones distintas dependiendo de una condicion.
;	mft3(m, f, t)
;		if f + t > 100
;			return 2 * f
;		else
;			return m - 5 * t

main:
	SET R7, 0xFF	; set stack
	SET R0, 0x10	; m
	SET R1, 0x25	; f
	SET R2, 0X30	; t
	SET R3, 0x64	; 0x64=100d
	
	CALL |R7|, mft3

halt:
	JMP halt

; idea para devolver valores originales, cargar todo a la pila.

mft3:
	PUSH |R7|, R3 ; entramos todos los registros a la pila
	PUSH |R7|, R0
	PUSH |R7|, R1
	PUSH |R7|, R2 ; a chequear
	
; IF
	ADD R1, R2	; vemos si se cumple el if
	CMP R3, R1  ; if f + t > 100 
	JN if ; Saltamos al if
	
; ELSE
	MOV R6, R2
	SET R4, 0x01	; seteamos R4 en 1
	SHL	R2, 0x02 ; seteamos R4 en 5
	ADD R2, R6
	SUB R0, R2 
	MOV R4, R0 ; Pasamos todo a R4
	ADD R0, R2 ; Reseteamos valor de M
	SHR	R2, 0x02 ; Reseteamos valor de T
	SUB R2, R6   ; Reseteamos valor de T

	POP |R7|, R2 ; a chequear
	POP |R7|, R1
	POP |R7|, R0 
	POP |R7|, R3
	
	RET |R7|

if:
	PUSH |R7|, R1
	SET R4, 0x00 ; aca voy a devolver el resultado
	SHL R1, 1 ; MUL *2 todo F
	MOV R4, R1 ; muevo todo a r4
	SHR R1, 1 ; reseteo todo F
	POP |R7|, R1
	RET |R7|