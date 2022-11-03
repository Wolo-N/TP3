; Escribir la funcion swaping que invierte la posicion de los datos entro de un arreglo de n numeros a partir de una direccion de memoria 'mem'.
;	swapping(mem,n)
;		for d=0 ; d<n/2 ; d=d+1
;			t = mem[d]
;			mem[d] = mem[n-d-1]
;			mem[n-d] = t

main:
	SET R7, 0xFF	; set stack
	SET R0, 0x60	; mem
	SET R1, 0x0A	; n
	
	CALL |R7|,inicializar_Array

	CALL |R7|, swapping

halt:
	JMP halt

swapping:
	MOV R2,R1		; R2 = n
	SHR R2,0x01	; R2 = n/2
	SET R3,0x00	; R3 = 0 = d
	
	ciclo:
	CMP R2,R3		; d == n/2?
	JZ endSwapping	; if (d == n/2) -> endSwapping
	CALL |R7|,swap	; else swap
	SET R4,0x01	; R4 = 1
	ADD R3,R4		; d++
	JMP ciclo		; reiniciar ciclo
	
	endSwapping:
	RET |R7|

swap:
	MOV R5,R1		; R5 = n
	SUB R5,R3		; R5 = n - d
	SET R6,0x01	; R6 = 1
	SUB R5,R6		; R5 = n - d - 1

	ADD R0,R3		; R0 = mem + d
	LOAD R4,[R0]	; R4 = [mem + d] = AUX = mem[d]
	SUB R0,R3		; R0 = mem

	ADD R0,R5		; R0 = mem + (n - d - 1)
	LOAD R6,[R0]	; R6 = mem[n - d - 1]
	SUB R0,R5		; R0 = mem
	
	

	ADD R0,R3		; R0 = mem + (d - 1)
	STR [R0],R6	; mem[d] = mem[n - d - 1]
	SUB R0,R3		; R0 = mem

	ADD R0,R5		; R0 = mem - n - d
	STR [R0],R4	; mem[n - d] = AUX
	SUB R0,R5		; R0 = mem

	RET |R7|
	
inicializar_Array:
	SET R4,0x00	;R4 = 0 = I
	SET R2,0x01	;R2 = 1
	ciclo_array:
	CMP R4,R1		;I =? n
	; IF(R4 == n):
	JZ fin_inicializacion: ; Termine el Array
	; ELSE:
	ADD R0,R4	;R0 = Mem + i
	STR [R0],R4	;Mem[R0] = i
	SUB R0,R4	;R0 = Mem
	ADD R4,R2	; i++
	JMP ciclo_array	
	
	fin_inicializacion:
	SET R4,0x00
	SET R2,0x00
	RET |R7|
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	