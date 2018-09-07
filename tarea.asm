%macro escribe 2   ; funcionalidad imprimir
mov eax,4 ; syswrite
mov ebx,1 ; sera una salida en pantalla
mov ecx,%1; puntero al mensaje
mov edx,%2; cantidad de caracteres del puntero a mensaje
int 0x80
%endmacro


section .data


arregloColumnas dd 0000  ;; se usa para mover contenidos de registros y subir a pila como dd
lenArrego equ $ -arregloColumnas
arregloCuatro db 0,1,2,3,4,5,6,-16;usado para imprimir numeros de filas en una matriz 4 por 4
matriz db -2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2
; matriz de 4 por 4 en total son 49 espacios contando los espacios vacios
arregloSeis db 17,18,19,20,21,22,23,24,25,26,27,-16;usado para imprimir numeros de filas en una matriz 6 por 6
matrizSeis db -2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2

arregloOcho db 17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,-16;usado para imprimir numeros de filas en una matriz 8 por 8
matrizOcho db -2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2,-16,-2




; mensajes que se utilizan con su respectiva cantidad de caracteres 
msgLogo0 db 0xA,0xA,"			(....\............../....)" ,0xA
msgLogo1 db "			.\....\........... /..../ ",0xA
msgLogo2 db"			..\....\........../..../ ",0xA
msgLogo3 db"			...\.../´¯.|.¯`\./ ",0xA
msgLogo4 db"			.../... |....|.... (¯ `\" ,0xA
msgLogo5 db"			..|.....|´¯.|´¯.|\....\ ",0xA
msgLogo6 db"			..\......` ¯..¯ ´....../" ,0xA
msgLogo7 db"			...\_ ............ _../  ",0xA,0xA
lenMsgLogo equ  $ - msgLogo0


msgBienvenida db 0xA,"		Bienvenido al famoso juego Timbiriche!",0xA
msgBienvenida2 db "	Por favor indique el tamano de la matriz en que quiere jugar",0xA 
msgBienvenida3 db "			(Tamanos: P-[4x4], M-[6x6], G-[8x8])   ",0xA
lenBienvenida equ $ - msgBienvenida
numeroIngresado db 0xA,"El tamano que vas a ingresar es:  "
lenNumeroIngresado equ $ - numeroIngresado


msg3 db 0xA,"Ingrese numero de fila donde se encuentra la linea que quiere trazar:   "
len3 equ $ - msg3
msg4 db "Ingrese numero columna donde quiere trazar la linea:   "
len4 equ $ - msg4

msgRevancha db 0xA,"Volveras a jugar con los mismos jugadores (1-Si 0-No 2-Reiniciar juego):   "
lenRevancha equ $ - msgRevancha



turno1 db 0xA,"	Jugador uno es su turno",0xA  
lenTurno1 equ $ - turno1
turno2 db 0xA,"	Jugador dos es su turno",0xA
lenTurno2 equ $ - turno2
turno3 db 0xA,"	Jugador tres es su turno",0xA
lenTurno3 equ $ - turno3
turno4 db 0xA,"	Jugador cuatro es su turno",0xA
lenTurno4 equ $ - turno4

ganaM1 db 0xA,"$		JUGADOR UNO GANA LA PARTIDA",0xA
lenM1 equ $ - ganaM1
ganaM2 db 0xA,"$		JUGADOR DOS GANA LA PARTIDA",0xA
lenM2 equ $ - ganaM2
ganaM3 db 0xA,"$		JUGADOR TRES GANA LA PARTIDA",0xA
lenM3 equ $ - ganaM3
ganaM4 db 0xA,"$		JUGADOR CUATRO GANA LA PARTIDA",0xA
lenM4 equ $ - ganaM4

empate db 0xA,"			HA EXISTIDO UN EMPATE",0xA,0xA
lenEmpate equ $ - empate

atencion db 0xA,0xA,"			DATO INVALIDO SE VUELVE AL INICIO ",0xA,0xA
lenAtencion equ $ - atencion

dosJugador db "* 2: Dos jugadores",0xA
lenDosJugador equ $ - dosJugador
tresJugador db "* 3: Tres jugadores",0xA
lenTresJugador equ $ - tresJugador
cuatroJugador db "* 4: Cuatro jugadores",0xA
lenCuatroJugador equ $ - cuatroJugador
guion db "-------------------------------------------------------------------------------"
lenGuion equ $ - guion
jugadoresDisponibles db 0xA,"Cantidad de jugadores disponibles para esta matriz son:",0xA
lenJugadoresDisponibles equ $ - jugadoresDisponibles
cantidadJugadores db 0xA,0xA,"$ Ingrese la cantidad de jugadores adecuada:  ",
lenCantidadJugadores equ $ - cantidadJugadores 

nombreJugador db 0xA,"Favor ingresar nombre del jugador:  "
lenNombreJugador equ $ - nombreJugador

jugadores dd 00 ; se guarda la cantidad de jugadores que van a usar el juego

saltoLinea db 0xA
lenSalto equ  $ - saltoLinea ; espacio y salto de linea con su largo adecuado
espacio db "   "
lenEspacio equ $ -espacio
espacio1 db "	"
lenEspacio1 equ $ - espacio1


numero11 dd 11 ; largo arreglo 6 por 6 (matriz mediana);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; variables matriz 6 por 6
numero12 dd 0012 ; se usa para desplazarnos por los espacion que puede haber letra y asi verficiar si existe letra o no esto en una 6 por 6
once dd 11;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
diez dd 10;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;matriz 6 variables que se necesitan



numero15 dd 15 ; largo arreglo 6 por 6 (matriz mediana);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
numero16 dd 0016 ; se usa para desplazarnos por los espacion que puede haber letra y asi verficiar si existe letra o no esto en una 4 por 4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
quince dd 15;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



numero7 dd 7 ; largo arreglo 4 por 4 (matriz pequena)
numero dd 0008 ; se usa para desplazarnos por los espacion que puede haber letra y asi verficiar si existe letra o no esto en una 4 por 4
contador1 dd 0; se usa para saber cuando debe hacer cambio de linea o un espacio en la funcion de verficar letra
contador2 dd 0 ;se usa para saber cuando salir de la funcion verificaLetra
uno dd 1; se usa para una formula q permite saber si hay cuadro o no
siete dd 7

letra dd 000 ; j letras de los jugadores
letra1 dd 000; c
letra2 dd 000
letra3 dd 000
dimension dd 000
turnoDosJugadores dd 0
contadorGane dd 0


mayor1 dd 0
mayor2 dd 0

puntajeJ1 dd 0
puntajeJ2 dd 0
puntajeJ3 dd 0
puntajeJ4 dd 0


vertical dd 76 ; lineas horizontales sin ascci es 76 su valor
horizontal dd 47 ; lineas verticales sin ascci es 47 su valor



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss ; seccion de variables no inicializadas

res resb 4 ; se utiliza para imprimir arreglo
res1 resb 4
tamanoMatriz resb 2

resArreglo resb 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;

columna resb 2 ; se usa para almacenar el valor de fila cuando se solicite
fila resb 2; se usa para almacenar el valor de columna cuando se solicite

basura resb 4 ; se ira almacenando lo q no es util 

nombreJugadoresJuego resb 10



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text ; inicia la logica

global _start ; etiqueta de inicio


_start:

mov al,0  ; limpia todo y lo pone en cero por aquello de que el juego se reinicie
mov [puntajeJ1],al
mov al,0
mov [puntajeJ2],al
mov al,0
mov [puntajeJ3],al
mov al,0
mov [puntajeJ4],al
mov al,0
mov [letra],al
mov al,0
mov [letra1],al
mov al,0
mov [letra2],al
mov al,0
mov [letra3],al
mov al,0
mov [mayor2],al
mov al,0
mov [mayor1],al
mov al,0
mov [dimension],al
mov al,0
mov [turnoDosJugadores],al
mov al,0
mov [contadorGane],al


xor eax,eax ; puede que un digito se ingrese mal entonces se regresa al incio por esta razon es que 
xor ebx,ebx  ; son limpiados los registros 
xor ecx,ecx
xor edx,edx


escribe msgLogo0,lenMsgLogo
escribe msgBienvenida,lenBienvenida ; mensaje de bienvenida 
escribe numeroIngresado,lenNumeroIngresado

; el usuario coloca o digita el tamano del que quiere que sea la mattriz
; en la que va jugar
; se compara si es 4 pequena  6 mediana 9 grande si no es ninguno de esos numeros
;brinca a la primer etiqueta para que elija un numero valido
	mov eax,3
	mov ebx,0 
	mov ecx,tamanoMatriz
	mov edx,2
	int 0x80

	mov al,[tamanoMatriz]
	sub al,'0'
	
	cmp al,32
	je jugadoresMatrizP
	cmp al,64
	je jugadoresMatrizP

	cmp al,29
	je jugadoresMatrizM
	cmp al,61
	je jugadoresMatrizM

	cmp al,23
	je jugadoresMatrizG
	cmp al,55
	je jugadoresMatrizG
	jmp _start
	


jugadoresMatrizP:  ; se imprime y se lee la cantidad de jugadores que solicita el usuario en la matriz
	mov [dimension],al  ; este caso seria el de la matriz pequena, solo se hace una comparacion con dos
	escribe saltoLinea,lenSalto ;porque se valida q en la pequena esa sea la unica cantidad que se pueda elegir
	escribe saltoLinea,lenSalto
	escribe jugadoresDisponibles,lenJugadoresDisponibles
	escribe saltoLinea,lenSalto
	escribe dosJugador,lenDosJugador
	escribe saltoLinea,lenSalto
	escribe guion,lenGuion
	escribe cantidadJugadores,lenCantidadJugadores
	mov eax,3
	mov ebx,0
	mov ecx,tamanoMatriz
	mov edx,2
	int 0x80
	escribe guion,lenGuion
	mov al,[tamanoMatriz]
	sub al,48
	mov[jugadores],al; cantidadJugadores
	cmp al,2
	je dosJugadoresSeleccionados
	escribe atencion,lenAtencion
	escribe guion,lenGuion
	jmp _start



jugadoresMatrizM:  ; se imprime y se lee la cantidad de jugadores que solicita el usuario en la matriz
	mov [dimension],al  ; ; este caso seria el de la matriz grande,  se hace una comparacion con dos
	escribe saltoLinea,lenSalto ;y con tres en caso de que el usuario quiera jugar con diferente cantidad de jugadores
	escribe saltoLinea,lenSalto
	escribe jugadoresDisponibles,lenJugadoresDisponibles
	escribe saltoLinea,lenSalto
	escribe dosJugador,lenDosJugador
	escribe tresJugador,lenTresJugador
	escribe saltoLinea,lenSalto
	escribe guion,lenGuion
	escribe cantidadJugadores,lenCantidadJugadores
	mov eax,3
	mov ebx,0
	mov ecx,tamanoMatriz
	mov edx,2
	int 0x80
	escribe guion,lenGuion
	mov al,[tamanoMatriz]
	sub al,48
	mov[jugadores],al  ; cantidadJugadores
	cmp al,2
	je dosJugadoresSeleccionados
	cmp al,3
	je tresJugadoresSeleccionados
	escribe atencion,lenAtencion
	escribe guion,lenGuion
	jmp _start




jugadoresMatrizG:  ; se imprime y se lee la cantidad de jugadores que solicita el usuario en la matriz
	mov [dimension],al  ; este caso seria el de la matriz grande,  se hace una comparacion con dos
	escribe saltoLinea,lenSalto ; con tres y con cuatro en caso de que el usuario quiera jugar con diferente cantidad de jugadores
	escribe saltoLinea,lenSalto
	escribe jugadoresDisponibles,lenJugadoresDisponibles
	escribe saltoLinea,lenSalto
	escribe dosJugador,lenDosJugador
	escribe tresJugador,lenTresJugador
	escribe cuatroJugador,lenCuatroJugador
	escribe saltoLinea,lenSalto
	escribe guion,lenGuion
	escribe cantidadJugadores,lenCantidadJugadores
	mov eax,3
	mov ebx,0
	mov ecx,tamanoMatriz
	mov edx,2
	int 0x80
	escribe guion,lenGuion
	mov al,[tamanoMatriz]
	sub al,48
	mov[jugadores],al  ; cantidadJugadores
	cmp al,2
	je dosJugadoresSeleccionados
	cmp al,3
	je tresJugadoresSeleccionados
	cmp al,4
	je cuatroJugadoresSeleccionados
	escribe atencion,lenAtencion
	escribe guion,lenGuion
	jmp _start




dosJugadoresSeleccionados: ; se solicita el nombre de dos jugadores , se guarda la primer letra del nombre 
	escribe saltoLinea,lenSalto  ; para luego colocarla dento del cuadro en caso de que se haga un punto
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra1],al

	mov al,[dimension]
	cmp al,32
	je inicio
	cmp al,64
	je inicio

	cmp al,29
	je inicioMatriz6
	cmp al,61
	je inicioMatriz6

	cmp al,23
	je inicioMatriz8  ; matriz 8 iria aqui;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cmp al,55
	je inicioMatriz8 

	jmp salir

tresJugadoresSeleccionados: ;  se solicita el nombre de dos jugadores , se guarda la primer letra del nombre 
	escribe saltoLinea,lenSalto ; para luego colocarla dento del cuadro en caso de que se haga un punto
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra1],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra2],al

	mov al,[dimension]
	cmp al,29
	je inicioMatriz6
	cmp al,61
	je inicioMatriz6

	cmp al,23
	je inicioMatriz8   ; iria matriz 8;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cmp al,55
	je inicioMatriz8 

	jmp salir
	

cuatroJugadoresSeleccionados: ; se solicia el nombre de cuatro jugadores, se guarda la primer letra del nombre
	escribe saltoLinea,lenSalto ;para luego colocarla dento del cuadro en caso de que se haga un punto
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra1],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra2],al
	escribe nombreJugador,lenNombreJugador
	mov eax,3
	mov ebx,0
	mov ecx,nombreJugadoresJuego
	mov edx,10
	int 0x80
	mov al,[nombreJugadoresJuego]
	sub al,'0'
	mov [letra3],al

	mov al,[dimension]
	cmp al,23
	je inicioMatriz8 ;inicioMatriz8  ; matriz 8;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cmp al,55
	je inicioMatriz8 ;inicioMatriz8


	jmp salir





	




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

inicio: ; se hara lo de los turnos en caso de que sean dos jugadores
mov al,[turnoDosJugadores]

cmp al,0
je primerTurnoMatriz ; si es cero significa que va el jugador uno 
escribe turno2,lenTurno2
jmp inicio1


primerTurnoMatriz:
	escribe turno1,lenTurno1
	jmp inicio1
	

inicio1: 
;funcio la cual requiere de un contador  que ira imprimiendo las columnas
; del 0 al 6 en una matriz de 4 por 4

escribe saltoLinea,lenSalto
escribe espacio1,lenEspacio1

mov esi,0
imprimeColumnas:
	add esi,'0' ; se le suma '0' para convertirlo a ascii
	mov [res],esi ; se mueve al contednido de la variable no inicializada
	escribe res,2 ; se imprime
	escribe espacio,lenEspacio ; se iran imprimiendo espacios luego de cada digito
	sub esi,'0'; se le resta para poder manipularlo e irle sumando 
	add esi,1
	cmp esi,7 ; comparacion entre el contador y 7
	jb imprimeColumnas ; cuando llegue a 7 se detendra 
	escribe saltoLinea,lenSalto ; luego imprime un salto de linea usando el 0xA




	mov eax,0 ; se utilizaran como contadores para imprimir las filas y tambien para imprimir la matriz
	mov edi,0
	
	push eax  ; se introduce en pila en valor de eax para luego utilizarlo
	mov al,[arregloCuatro+eax] ; se usa eax como contador y asi recorrer el arreglo que contiene 
	add al,'0'  				; los numeros de las filas en una matriz 4 por 4
	mov [resArreglo],al ; los numeros de filas se iran imprimiendo almacenandolos en resArreglo
	
	escribe resArreglo,2 ; escribe el numero de la primer fila
	

	
	escribe espacio1,lenEspacio1


	mov esi,0
	mov edi,0

; funcion en la cual se imprime el arreglo en forma de matriz de 4 por 4 
; hay dos contadores cuando uno llegue a 7 se hara un cambio de linea;
; el siete significa que ya completo todo los espacios en una linea
; el -2 significa un punto mas 48 y el -16  un espacio en blanco mas 48
; el segundo contador llevara la cuenta al llegar a 49 habra impreso
; todo el contenido del arreglo

	imprimeMatriz:

		mov al,[matriz+esi] ; esi se encarga de ir recorriendo la matriz 
		add al,'0'
		mov [res],al
		
		escribe res,2
		escribe espacio,lenEspacio
		;escribe espacio,lenEspacio
		add edi,1
		add esi,1
		cmp edi,7
		jb imprimeMatriz
		escribe saltoLinea,lenSalto

		pop eax ; se hace un pop para no alterar el valor de eax
		add eax,1
		push eax ; luego un push para guardar su valor actual al sumarle uno en pila
		mov al,[arregloCuatro+eax] ; se imprime el numero de fila
		add al,'0'
		mov [resArreglo],al

		escribe resArreglo,2

		escribe espacio1,lenEspacio1
		mov edi,0
		cmp esi,49 ; comparacion para saber si ya ha recorrido toda la matriz
		jb imprimeMatriz
		escribe saltoLinea,lenSalto


	
	
	; funcion la que se imprime un mensaje solicitando la fila en donde se encuentra
	; la linea que va colocar el jugador y luego ese digito que ingresa se guarda en res y
	; es subido a la pila como entero
	; luego se imprime un mensaje solicitando la columna donde se encuentra la linea que va colocar
	; el numero que digito o ingreso se sube como entero la pila
	; para luego almacenar en fila  y columna (Variables no inicializadas); y lograr aplicar formula
	; que es fila por siete (en este caso q es una matriz de 4 por 4) mas columna 

	;
	mover:

		escribe msg3,len3 ; se imprime digite el numero de fila 
		mov eax,3 ; sysread
		mov ebx,0 ; va ser una entrada en el sistema
		mov ecx,res1 ; puntero a  la reserva no inicializada
		mov edx,2 ; tamano de la reserva
		int 0x80


		mov al,[res1]
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce como entero el valor de res que introdujo el usuario


		escribe msg4,len4; se imprime digite el numero de fila 
		mov eax,3; sysread
		mov ebx,0; va ser una entrada en el sistema
		mov ecx,res1; puntero a  la reserva no inicializada
		mov edx,2; tamano de la reserva
		int 0x80

	
		mov al,[res1]
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]  ; se termina de meter la fila y columna de la raya 

		fistp dword[columna] ; el valor de columna se almacena en la variable columna
		fistp dword[fila]; el valor de columna se almacena en la variable columna

		; ahora se hara la comparacion de la fila si es par o no
		

		mov al,[fila]
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce el valor de fila como entero
		fild dword[numero7] ; se introduce el siete para hacer la multiplicacion
		fmul st1

		mov al,[columna]
		mov [arregloColumnas],al
		fild dword[arregloColumnas]  ; se introduce el valor de la columna
		fadd st0,st1 ; se suma el valor de la multiplicacion con la columna

		fistp dword[res1]  ; resultado esta en res1
		fistp dword[basura]; se vacea la pila
		fistp dword[basura]

		mov esi,[res1] ; se mueve el contenido de res1 (lo que dio la formula fila por 7 mas columna) a esi
		;fild dword[res1]
		;fild dword[matriz+1]
		mov al,[matriz+esi]  ; se verifica que la posicion elegida sea un espacio vacio
		cmp al,240 ; el 240 es igual a un espacio en blanco
		je sigue ; en caso de que si brinca a la etiqueta sigue
		jmp mover ; si no fuese asi se devuelve a solicitar numero de fila y columna correcto

	sigue:
		mov al,0
		mov bl,[fila]

		jmp comparaFila

		; se hace un ciclo en el que se compara si la fila es par o no 
		; se usa un contador que inicia en cero y se le ira sumando 2 cada ocasion
		comparaFila:
			;fild dword[arregloColumnas]
			cmp al,bl
			je pares1
			add al,2
			cmp al,7 ; finaliza cuando llega a siete se pone este numero por que se trabaja en una 4 por 4
			jb comparaFila
			jmp impares1

	
		pares1:
			;fild dword[columna]
			mov bl,1; se usa un contador que inicia en uno
			mov al,[columna] ; se mueve lo que contiene columna al registo al
			jmp pares2
		
		; como la fila es par segun la logica que se ha seguido la columna debera ser impar;
		; ya que se si se coloca una fila par y columna par se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 1 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto

		pares2:  
			cmp al,bl
			je pares ; si los datos estan bien  brinca a la etiqueta pares
			add bl,2
			cmp bl,6 ; como es matriz de 4 por 4 al ser fila par su maxima columna colocada podra ser 5
			jb pares2
			jmp mover



		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 4 por 4, el contador1 y contador2 tambien son usados colocandolos en cero 
		pares:
			mov esi,[contadorGane] ;cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1				; se le suma un o al contadorGane al llegar a 24 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 4 por 4


			mov esi,[res1]
			mov al,[horizontal]
			mov [matriz+esi],al ; se coloca la raya en la posicion de la matriz
			
			

			mov al,8  ; se coloca la variable numero con valor 8 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero],al 
			
			mov al,0  ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzo	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete
	
		

		impares1:
			;fild dword[columna]
			mov bl,0; se usa un contador que inicia en cero
			mov al,[columna]; se mueve lo que contiene columna al registo al
			jmp impares2
		


		; como la fila es impar segun la logica que se ha seguido la columna debera ser par;
		; ya que se si se coloca una fila impar y columna impar se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 0 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto
		impares2:
			cmp al,bl
			je impares; si los datos estan bien  brinca a la etiqueta impares
			add bl,2
			cmp bl,7
			jb impares2
			jmp mover


		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 4 por 4, el contador1 y contador2 tambien son usados colocandolos en cero 
		impares:

			mov esi,[contadorGane];cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1			; se le suma un o al contadorGane al llegar a 24 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 4 por 4
			
			mov esi,[res1]
			mov al,[vertical]
			mov [matriz+esi],al; se coloca la raya en la posicion de la matriz
			


			mov al,8; se coloca la variable numero con valor 8 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero],al
			
		
			mov al,0 ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzo	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete


	

	;se verifica el contenido del contadorGane en caso de que sea 24 significara que ya no quedan espacion en donde colocar raya
	; por lo que el juego habra terminado , de esta manera brincara a la etiqueta revanca , en donde se le da al usuario la opcion
	; de salir o volver a jugar con los mismos jugadores, si el contadorGane no es 24 brinca a la etiqueta turnos

	gane:
		mov esi,[contadorGane]
 		cmp esi,24; comparacion entre el contenido del contadorGane y 24
 		je revancha
 		jmp turnos
 	
 	turnos:
 		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUno
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicio

 	igualUno:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicio



; funcion en donde se verifica si hay cuadro o no en casoo de que si se coloca la letra del jugador dentro de el
; se va verificando espacio por espacio iniciando en la posicion 8 del arreglo , se debe ir sumando uno o restando,
;ademas sumando 8 y tambien restando en otros casos

 comienzo:
 	;escribe msg5,len5
 	mov al,[contador2] ; cuando el contador2 llegue a 9 significa que ya no quedan espacios por recorrer por lo que brinca a gane 
 	cmp al,9 ; en total se haran nueve cuadros
 	je gane

 	mov al,[contador1] ; cuando el contador uno llegue a 3 significa que viene un cambio de linea por eso se aumenta en ocho
 	cmp al,3
 	je inicializar

continua:
 	mov esi,[numero]
 	;fild dword[numero];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	mov al,[matriz+esi] ; se compara  la posicion de la matriz con vacio el cual significa 240 en caso de que no haya letra brinca a cuadroVacio
 	cmp al,240  ; se compara si esta o no vacio
 	je cuadroVacio
 	jmp noCuadro ; si hay letra brincara a noCuadro

 	
 noCuadro:
 	mov al,[numero] ; se le suma dos al contador que se usa para ir recorriendo la matriz asi se ubicara en el otro espacio para luego verificar
 	add al,2
 	mov [numero],al
 	mov al,[contador1] ; se le suma uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	jmp comienzo ; se brinca al comienzo 


 inicializar:
 	mov al,[contador1] ; al llegar a 3 el contador se inicializa en cero y se le suma 8 al contador que se usa para recorrer la matriz
 	mov al,0
 	mov[contador1],al
 	mov al,[numero]
 	add al,8 ; al sumarle 8 se ubicara en la otra linea en el espacio correspondiente para verificar si hay letra o no
 	mov[numero],al
 	jmp continua


; aqui se verifica el contenido de turnoDosJugadores si es 0 significa que la letra que ira en el cuadro sera la del 
;jugador uno en caso de que sea 1 sera la letra del jugador2

verificaLetra:
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igual ; si es igual a cero es jugador uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov[puntajeJ2],al

 	mov esi,[numero]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matriz+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,0
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzo


 	;fild dword[numero]
 	
 igual:
 	mov al,[puntajeJ1]
 	add al,1
 	mov[puntajeJ1],al
 	mov esi,[numero]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matriz+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,1
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzo


; esta funcion lo que se encarga es de comparar si alrededor del espacio que puede existir letra hay lineas o no
;para ello se le suma uno al inicio, luego se le resta, el siguiente paso es sumarle ocho y al final restarle ocho a la
; posicion de la matriz donde se es ubicado, es importante mencionar que esta posicion ya se es verificada anteriormente
; por lo que es un espacio vacio
; al final si hay lineas en cada extremo brinca a la etiqueta igual o igual1 dependiendo del turno que sea
; alli se coloca la letra en el cuadro

 cuadroVacio:
 	fild dword[numero] ; se introduce la posicion donde se encuentra en la pila
 	fild dword[uno] ; se ingresa el uno
 	fadd st0,st1 ; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]; se vacea la pila
 	mov esi,[res]
 	mov al,[matriz+esi] 
 	cmp al,240; se compara que no haya raya
 	je noCuadro  ;; en caso de que no exista rayita  

 	fild dword[uno]; se ingresa el uno
 	fild dword[numero] ; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matriz+esi]
 	cmp al,240; se compara que no haya raya
 	je noCuadro

 	fild dword[siete]; se ingresa el siete
 	fild dword[numero]; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matriz+esi]
 	cmp al,240; se compara que no haya raya
 	je  noCuadro

 	fild dword[siete]; se ingresa el siete
 	fild dword[numero]; se introduce la posicion donde se encuentra en la pila
 	fadd st0,st1; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matriz+esi]
 	cmp al,240 ;  ; se compara que no haya raya
 	je  noCuadro
 	jmp verificaLetra  ; si hay cuadro brinca a letras para saber cual de la de los dos jugadores es




;al finalizar el juego se dirige aqui donde se le consulta al usuario si quiere volver a jugar
; en caso de que digite 0 (no)se sale pero si digita  1 se inicializa el tablero como en un inicio con los
;espacios vacios y sin letras, tambien se debe inicializar el contadorGane

revancha:     ; funcion en la que se verifica cual de los jugadores es el quien gana la partida
	mov al,[puntajeJ1]
	mov bl,[puntajeJ2]
	cmp al,bl					; se hace una comparacion del jugador uno con el dos
	jb pj2Mayor
	cmp bl,al					; el resultado mayor se almacena enu una variable
	jb pj1Mayor

	mov [mayor1],al
	jmp segundaComparacion


pj2Mayor:
	mov al,[puntajeJ2]
	mov [mayor1],al
	jmp segundaComparacion

pj1Mayor:
	mov al,[puntajeJ1]
	mov [mayor1],al
	jmp segundaComparacion

segundaComparacion:
	mov al,[puntajeJ3]
	mov bl,[puntajeJ4]			; se hace una comparacion del jugador tres con el cuatro		
	cmp al,bl
	jb pj4Mayor					; el resultado mayor se almacena enu otra variable
	cmp bl,al
	jb pj3Mayor

	mov [mayor2],al
	jmp terceraComparacion


pj4Mayor:
	mov al,[puntajeJ4]
	mov [mayor2],al
	jmp terceraComparacion

pj3Mayor:
	mov al,[puntajeJ3]
	mov [mayor2],al
	jmp terceraComparacion

terceraComparacion:
	mov al,[mayor1]				; se hace una comparacion de las dos variables para saber 
	mov bl,[mayor2]				  ; cual es la mayor
	cmp al,bl
	jb ganarMayor2
	cmp bl,al
	jb ganarMayor1
	escribe guion,lenGuion
	escribe empate,lenEmpate  ; si fuesesn iguales imprime empate
	escribe guion,lenGuion
	jmp revancha1

ganarMayor2:
	mov al,[puntajeJ1]				; la variable mayor se va comparando con cada uno  de los puntajes;
	mov bl,[mayor2]					; asi se sabra cual de los 4 jugadores ha ganado
	cmp al,bl
	je jugadorUnoGana

	mov al,[puntajeJ2]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorDosGana

	mov al,[puntajeJ3]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorTresGana

	mov al,[puntajeJ4]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorCuatroGana	
	
	jmp revancha1

ganarMayor1:
	mov al,[puntajeJ1]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorUnoGana			; la variable mayor se va comparando con cada uno  de los puntajes;
								; asi se sabra cual de los 4 jugadores ha ganado
	mov al,[puntajeJ2]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorDosGana

	mov al,[puntajeJ3]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorTresGana

	mov al,[puntajeJ4]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorCuatroGana	
	
	jmp revancha1


jugadorUnoGana:						; se imprime cual ha ganado
	escribe guion,lenGuion
	escribe ganaM1,lenM1
	escribe guion,lenGuion
	jmp revancha1
jugadorDosGana:
	escribe guion,lenGuion
	escribe ganaM2,lenM2
	escribe guion,lenGuion
	jmp revancha1
jugadorTresGana:
	escribe guion,lenGuion
	escribe ganaM3,lenM3
	escribe guion,lenGuion
	jmp revancha1
jugadorCuatroGana:
	escribe guion,lenGuion
	escribe ganaM4,lenM4
	escribe guion,lenGuion
	jmp revancha1


	
revancha1:
	escribe msgRevancha,lenRevancha ; se le pregunta al usuario si quiere volver a jugar
	mov eax,3 ; sysread
	mov ebx,0 ; entrada del sistema
	mov ecx,res ; se alamacena en res
	mov edx,2 ; tamano de la reserva
	int 0x80

	mov al,[res]
	sub al,'0'
	cmp al,1; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je inicializarTablero
	cmp al,2; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je _start1
	jmp salir ; en caso de que no sea asi se sale del juego

_start1:
	call inicializarTablero0
	jmp _start

inicializarTablero:
	call inicializarTablero0
	jmp inicio

inicializarTablero0:
	mov esi,0
	jmp inicializarTablero1
	; si es un punto se mantiene si contiene raya o letra se cambia por un espacio vacio

inicializarTablero1:
	mov al,[matriz+esi]
	cmp al,254 ; se hace una comparacion de la posicion del arreglo con 254 que seria un punto 
	je avance ; en caso de que sea igual
	mov al,-16; se cambia el contenido de la poscion de la matriz por vacio que es igual a -16
	mov [matriz+esi],al
	add esi,1
	cmp esi,49 ; se hace una comparacion con 49 lo cual significara que ya recorrio toda la matriz
	jb inicializarTablero1 ; este caso es para una matriz de 4 por 4
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [contadorGane],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ2],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ3],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ4],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor2],al
	ret
	

avance:
	add esi,1 ; se le suma al contador y vuelve a la etiqueta
	jmp inicializarTablero1
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MATRIZ DE 6 POR 6


inicioMatriz6: ; se hara lo de los turnos en caso de que sean dos jugadores
mov al,[jugadores] ; puede ser dos o tres
cmp al,2
je matriz6DosJugadores

mov al,[turnoDosJugadores]
cmp al,0
je primerTurnoMatriz6A ; si es cero significa que va el jugador uno 
cmp al,1
je segundoTurnoMatriz6A
escribe turno3,lenTurno3
jmp inicio1Matriz6

primerTurnoMatriz6A:
	escribe turno1,lenTurno1
	jmp inicio1Matriz6

segundoTurnoMatriz6A:
	escribe turno2,lenTurno2
	jmp inicio1Matriz6



matriz6DosJugadores:; si es dos jugadores
	mov al,[turnoDosJugadores]

	cmp al,0
	je primerTurnoMatriz6 ; si es cero significa que va el jugador uno 
	escribe turno2,lenTurno2
	jmp inicio1Matriz6


	primerTurnoMatriz6:
		escribe turno1,lenTurno1
		jmp inicio1Matriz6
		


inicio1Matriz6: 
;funcio la cual requiere de un contador  que ira imprimiendo las columnas
; del 0 al 6 en una matriz de 6 por 6

escribe saltoLinea,lenSalto
escribe espacio1,lenEspacio1

mov esi,17
imprimeColumnasMatriz6:
	add esi,'0' ; se le suma '0' para convertirlo a ascii
	mov [res],esi ; se mueve al contednido de la variable no inicializada
	escribe res,2 ; se imprime
	escribe espacio,lenEspacio ; se iran imprimiendo espacios luego de cada digito
	sub esi,'0'; se le resta para poder manipularlo e irle sumando 
	add esi,1
	cmp esi,28 ; comparacion entre el contador y 28
	jb imprimeColumnasMatriz6 ; cuando llegue a 28 se detendra 
	escribe saltoLinea,lenSalto ; luego imprime un salto de linea usando el 0xA




	mov eax,0 ; se utilizaran como contadores para imprimir las filas y tambien para imprimir la matriz
	mov edi,0
	
	push eax  ; se introduce en pila en valor de eax para luego utilizarlo
	mov al,[arregloSeis+eax] ; se usa eax como contador y asi recorrer el arreglo que contiene 
	add al,'0'  				; los numeros de las filas en una matriz 6 por 6
	mov [resArreglo],al ; los numeros de filas se iran imprimiendo almacenandolos en resArreglo
	
	escribe resArreglo,2 ; escribe el numero de la primer fila
	

	
	escribe espacio1,lenEspacio1


	mov esi,0
	mov edi,0

; funcion en la cual se imprime el arreglo en forma de matriz de 4 por 4 
; hay dos contadores cuando uno llegue a 11 se hara un cambio de linea;
; el once significa que ya completo todo los espacios en una linea
; el -2 significa un punto mas 48 y el -16  un espacio en blanco mas 48
; el segundo contador llevara la cuenta al llegar a 121 habra impreso
; todo el contenido del arreglo

	imprimeMatriz6:

		mov al,[matrizSeis+esi] ; esi se encarga de ir recorriendo la matriz 
		add al,'0'
		mov [res],al
		
		escribe res,2
		escribe espacio,lenEspacio
		;escribe espacio,lenEspacio
		add edi,1
		add esi,1
		cmp edi,11
		jb imprimeMatriz6
		escribe saltoLinea,lenSalto

		pop eax ; se hace un pop para no alterar el valor de eax
		add eax,1
		push eax ; luego un push para guardar su valor actual al sumarle uno en pila
		mov al,[arregloSeis+eax] ; se imprime el numero de fila
		add al,'0'
		mov [resArreglo],al

		escribe resArreglo,2

		escribe espacio1,lenEspacio1
		mov edi,0
		cmp esi,121 ; comparacion para saber si ya ha recorrido toda la matriz
		jb imprimeMatriz6
		escribe saltoLinea,lenSalto


	
	
	; funcion la que se imprime un mensaje solicitando la fila en donde se encuentra
	; la linea que va colocar el jugador y luego ese digito que ingresa se guarda en res y
	; es subido a la pila como entero
	; luego se imprime un mensaje solicitando la columna donde se encuentra la linea que va colocar
	; el numero que digito o ingreso se sube como entero la pila
	; para luego almacenar en fila  y columna (Variables no inicializadas); y lograr aplicar formula
	; que es fila por once (en este caso q es una matriz de 4 por 4) mas columna 

	; verifica que el numero que se introduce para la fila sea de un digito o 
	; de dos en caso de que sea de dos se introduce a la pila se multiplica por 10 la primer pos del res
; y luego se le suma la segunda posicion del res

	moverMatriz6:
		escribe msg3,len3 ; se imprime digite el numero de fila 
		mov eax,3 ; sysread
		mov ebx,0 ; va ser una entrada en el sistema
		mov ecx,res1 ; puntero a  la reserva no inicializada
		mov edx,3 ; tamano de la reserva
		int 0x80
		mov al,[res1+1]
		sub al,'0'	
		cmp al,218 ; se compara si el segundo digito del es vacio o no
		je procesoNormalMatriz6 ; en caso de que si es que el numero contiene solo un digito
		
		mov al,[res1]  ; si contiene dos el primer digito se introduce a la pila posicion cero
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]
		fild dword[diez]  ; luego se multiplica por 10
		fmul st1
		mov al,[res1+1] ; 
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce el segundo digito del res y se suma con lo dado por la multiplicacion
		fadd st1
		fistp dword[arregloColumnas]
		fistp dword[basura]
		fistp dword[basura]  ; se vacea la pila

		fild dword[arregloColumnas]
		
		jmp proceso1Matriz6

		procesoNormalMatriz6:; si solo contiene un digito se introduce a la pila sin ningun tipo de operacion
			mov al,[res1]
			sub al,'0'
			mov [arregloColumnas],al
			fild dword[arregloColumnas] ; se introduce como entero el valor de res que introdujo el usuario

		
	; verifica que el numero que se introduce para la columna sea de un digito o 
	; de dos en caso de que sea de dos se introduce a la pila se multiplica por 10 la primer pos del res
; y luego se le suma la segunda posicion del res	
	proceso1Matriz6:

		escribe msg4,len4; se imprime digite el numero de fila 
		mov eax,3; sysread
		mov ebx,0; va ser una entrada en el sistema
		mov ecx,res1; puntero a  la reserva no inicializada
		mov edx,3; tamano de la reserva
		int 0x80

		mov al,[res1+1]
		sub al,'0'	
		cmp al,218; se compara si el segundo digito del es vacio o no
		je procesoNormal2Matriz6; en caso de que si es que el numero contiene solo un digito
		
		mov al,[res1]; si contiene dos el primer digito se introduce a la pila posicion cero
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]
		fild dword[diez]; luego se multiplica por 10
		fmul st1
		mov al,[res1+1]
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]; se introduce el segundo digito del res y se suma con lo dado por la multiplicacion
		fadd st1
		fistp dword[arregloColumnas]
		fistp dword[basura]
		fistp dword[basura] ; se vacea la pila

		fild dword[arregloColumnas]
		
		jmp finProcesoMatriz6

	procesoNormal2Matriz6: ; si solo contiene un digito se introduce a la pila sin ningun tipo de operacion
			mov al,[res1]
			sub al,'0'
			mov [arregloColumnas],al
			fild dword[arregloColumnas]  ; se termina de meter la fila y columna de la raya
			jmp finProcesoMatriz6 

	finProcesoMatriz6:
		fistp dword[columna] ; el valor de columna se almacena en la variable columna
		fistp dword[fila]; el valor de columna se almacena en la variable columna

		; ahora se hara la comparacion de la fila si es par o no
		

		mov al,[fila]
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce el valor de fila como entero
		fild dword[numero11] ; se introduce el once para hacer la multiplicacion
		fmul st1

		mov al,[columna]
		mov [arregloColumnas],al
		fild dword[arregloColumnas]  ; se introduce el valor de la columna
		fadd st0,st1 ; se suma el valor de la multiplicacion con la columna

		fistp dword[res1]  ; resultado esta en res1
		fistp dword[basura]; se vacea la pila
		fistp dword[basura]

		mov esi,[res1] ; se mueve el contenido de res1 (lo que dio la formula fila por 7 mas columna) a esi
		;fild dword[res1]
		;fild dword[matriz+1]
		mov al,[matrizSeis+esi]  ; se verifica que la posicion elegida sea un espacio vacio
		cmp al,240 ; el 240 es igual a un espacio en blanco
		je sigueMatriz6 ; en caso de que si brinca a la etiqueta sigue
		jmp moverMatriz6 ; si no fuese asi se devuelve a solicitar numero de fila y columna correcto

	sigueMatriz6:
		mov al,0
		mov bl,[fila]

		jmp comparaFilaMatriz6

		; se hace un ciclo en el que se compara si la fila es par o no 
		; se usa un contador que inicia en cero y se le ira sumando 2 cada ocasion
		comparaFilaMatriz6:
			;fild dword[arregloColumnas]
			cmp al,bl
			je pares1Matriz6
			add al,2
			cmp al,11 ; finaliza cuando llega a once se pone este numero por que se trabaja en una 4 por 4
			jb comparaFilaMatriz6
			jmp impares1Matriz6

	
		pares1Matriz6:
			;fild dword[columna]
			mov bl,1; se usa un contador que inicia en uno
			mov al,[columna] ; se mueve lo que contiene columna al registo al
			jmp pares2Matriz6
		
		; como la fila es par segun la logica que se ha seguido la columna debera ser impar;
		; ya que se si se coloca una fila par y columna par se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 1 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto

		pares2Matriz6:  
			cmp al,bl
			je paresMatriz6 ; si los datos estan bien  brinca a la etiqueta pares
			add bl,2
			cmp bl,10 ; como es matriz de 6 por 6 al ser fila par su maxima columna colocada podra ser 9
			jb pares2Matriz6
			jmp moverMatriz6



		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 6 por 6, el contador1 y contador2 tambien son usados colocandolos en cero 
		paresMatriz6:
			mov esi,[contadorGane] ;cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1				; se le suma un o al contadorGane al llegar a 60 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 6 por 6


			mov esi,[res1]
			mov al,[horizontal]
			mov [matrizSeis+esi],al ; se coloca la raya en la posicion de la matriz
			
			

			mov al,12  ; se coloca la variable numero con valor 12 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero12],al 
			
			mov al,0  ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzoMatriz6	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete
	
		

		impares1Matriz6:
			;fild dword[columna]
			mov bl,0; se usa un contador que inicia en cero
			mov al,[columna]; se mueve lo que contiene columna al registo al
			jmp impares2Matriz6
		


		; como la fila es impar segun la logica que se ha seguido la columna debera ser par;
		; ya que se si se coloca una fila impar y columna impar se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 0 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto
		impares2Matriz6:
			cmp al,bl
			je imparesMatriz6; si los datos estan bien  brinca a la etiqueta impares
			add bl,2
			cmp bl,11
			jb impares2Matriz6
			jmp moverMatriz6


		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 6 por 6, el contador1 y contador2 tambien son usados colocandolos en cero 
		imparesMatriz6:

			mov esi,[contadorGane];cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1			; se le suma un o al contadorGane al llegar a 60 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 6 por 6
			
			mov esi,[res1]
			mov al,[vertical]
			mov [matrizSeis+esi],al; se coloca la raya en la posicion de la matriz
			


			mov al,12; se coloca la variable numero con valor 12 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero12],al
			
		
			mov al,0 ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzoMatriz6	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete


	

	;se verifica el contenido del contadorGane en caso de que sea 24 significara que ya no quedan espacion en donde colocar raya
	; por lo que el juego habra terminado , de esta manera brincara a la etiqueta revanca , en donde se le da al usuario la opcion
	; de salir o volver a jugar con los mismos jugadores, si el contadorGane no es 24 brinca a la etiqueta turnos

	ganeMatriz6:
		
		mov esi,[contadorGane]
 		cmp esi,60; comparacion entre el contenido del contadorGane y 60
 		je revanchaMatriz6
 		jmp turnosMatriz6
 	
 	turnosMatriz6:
 		mov al,[jugadores]
 		cmp al,2
 		je turnoDosMatriz6

 		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUnoMatriz6B

 		mov al,[turnoDosJugadores]
 		cmp al,1
 		je igualDosMatriz6B

 		mov al,[turnoDosJugadores]
 		cmp al,2
 		je igualTresMatriz6B

 	igualUnoMatriz6B:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz6


 	igualDosMatriz6B:
 		mov al,2
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz6

 	igualTresMatriz6B:
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz6




 	turnoDosMatriz6:
 		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUnoMatriz6
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz6

 	igualUnoMatriz6:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz6



; funcion en donde se verifica si hay cuadro o no en casoo de que si se coloca la letra del jugador dentro de el
; se va verificando espacio por espacio iniciando en la posicion 8 del arreglo , se debe ir sumando uno o restando,
;ademas sumando 8 y tambien restando en otros casos

 comienzoMatriz6:
 	;escribe msg5,len5
 	mov al,[contador2] ; cuando el contador2 llegue a 25 significa que ya no quedan espacios por recorrer por lo que brinca a gane 
 	cmp al,25 ; en total se haran nueve cuadros
 	je ganeMatriz6

 	mov al,[contador1] ; cuando el contador uno llegue a 5 significa que viene un cambio de linea por eso se aumenta en ocho
 	cmp al,5
 	je inicializarMatriz6

continuaMatriz6:
 	mov esi,[numero12]
 	;fild dword[numero];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	mov al,[matrizSeis+esi] ; se compara  la posicion de la matriz con vacio el cual significa 240 en caso de que no haya letra brinca a cuadroVacio
 	cmp al,240  ; se compara si esta o no vacio
 	je cuadroVacioMatriz6
 	jmp noCuadroMatriz6 ; si hay letra brincara a noCuadro

 	
 noCuadroMatriz6:
 	mov al,[numero12] ; se le suma dos al contador que se usa para ir recorriendo la matriz asi se ubicara en el otro espacio para luego verificar
 	add al,2
 	mov [numero12],al
 	mov al,[contador1] ; se le suma uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	jmp comienzoMatriz6 ; se brinca al comienzo 


 inicializarMatriz6:
 	mov al,[contador1] ; al llegar a 5 el contador se inicializa en cero y se le suma 12 al contador que se usa para recorrer la matriz
 	mov al,0
 	mov[contador1],al
 	mov al,[numero12]
 	add al,12 ; al sumarle 8 se ubicara en la otra linea en el espacio correspondiente para verificar si hay letra o no
 	mov[numero12],al
 	jmp continuaMatriz6


; aqui se verifica el contenido de turnoDosJugadores si es 0 significa que la letra que ira en el cuadro sera la del 
;jugador uno en caso de que sea 1 sera la letra del jugador2

verificaLetraMatriz6:
	mov al,[jugadores]
	cmp al,2
	je verificaLetraMatriz6A ; SI SON DOS jugadores

verificaLetraMatriz6B:
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igualMatriz6 ; si es igual a cero es jugador uno 
 	
	cmp al,1 
	je igualMatriz62 ; si es igual a  uno es jugador uno
	mov al,[puntajeJ3]
 	add al,1
 	mov [puntajeJ3],al
	
 	mov esi,[numero12]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra2]; se mueve el contenido de la letra1 al registro
 	mov [matrizSeis+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero12]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero12],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,1
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz6


 	;fild dword[numero]
 	
 igualMatriz6: ; si es igual a cero
 	mov al,[puntajeJ1]
 	add al,1
 	mov [puntajeJ1],al
 	mov esi,[numero12]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matrizSeis+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero12]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero12],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,2
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz6

 igualMatriz62: ; si es igual a uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov [puntajeJ2],al
 	mov esi,[numero12]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matrizSeis+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero12]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero12],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,0
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz6




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
verificaLetraMatriz6A:
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igualMatriz6A ; si es igual a cero es jugador uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov [puntajeJ2],al

 	mov esi,[numero12]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matrizSeis+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero12]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero12],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,0
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz6


 	;fild dword[numero]
 	
 igualMatriz6A:
 	mov al,[puntajeJ1]
 	add al,1
 	mov [puntajeJ1],al

 	mov esi,[numero12]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matrizSeis+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero12]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero12],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,1
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz6


; esta funcion lo que se encarga es de comparar si alrededor del espacio que puede existir letra hay lineas o no
;para ello se le suma uno al inicio, luego se le resta, el siguiente paso es sumarle ocho y al final restarle ocho a la
; posicion de la matriz donde se es ubicado, es importante mencionar que esta posicion ya se es verificada anteriormente
; por lo que es un espacio vacio
; al final si hay lineas en cada extremo brinca a la etiqueta igual o igual1 dependiendo del turno que sea
; alli se coloca la letra en el cuadro

 cuadroVacioMatriz6:
 	fild dword[numero12] ; se introduce la posicion donde se encuentra en la pila
 	fild dword[uno] ; se ingresa el uno
 	fadd st0,st1 ; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]; se vacea la pila
 	mov esi,[res]
 	mov al,[matrizSeis+esi] 
 	cmp al,240; se compara que no haya raya
 	je noCuadroMatriz6  ;; en caso de que no exista rayita  

 	fild dword[uno]; se ingresa el uno
 	fild dword[numero12] ; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizSeis+esi]
 	cmp al,240; se compara que no haya raya
 	je noCuadroMatriz6

 	fild dword[once]; se ingresa el once
 	fild dword[numero12]; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizSeis+esi]
 	cmp al,240; se compara que no haya raya
 	je  noCuadroMatriz6

 	fild dword[once]; se ingresa el once
 	fild dword[numero12]; se introduce la posicion donde se encuentra en la pila
 	fadd st0,st1; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizSeis+esi]
 	cmp al,240 ;  ; se compara que no haya raya
 	je  noCuadroMatriz6
 	jmp verificaLetraMatriz6  ; si hay cuadro brinca a letras para saber cual de la de los dos jugadores es




;al finalizar el juego se dirige aqui donde se le consulta al usuario si quiere volver a jugar
; en caso de que digite 0 (no)se sale pero si digita  1 se inicializa el tablero como en un inicio con los
;espacios vacios y sin letras, tambien se debe inicializar el contadorGane

revanchaMatriz6:
	mov al,[puntajeJ1]
	mov bl,[puntajeJ2]
	cmp al,bl					; se hace una comparacion del jugador uno con el dos
	jb pj2Mayor6
	cmp bl,al					; el resultado mayor se almacena enu una variable
	jb pj1Mayor6

	mov [mayor1],al
	jmp segundaComparacion6


pj2Mayor6:
	mov al,[puntajeJ2]
	mov [mayor1],al
	jmp segundaComparacion6

pj1Mayor6:
	mov al,[puntajeJ1]
	mov [mayor1],al
	jmp segundaComparacion6

segundaComparacion6:
	mov al,[puntajeJ3]
	mov bl,[puntajeJ4]			; se hace una comparacion del jugador tres con el cuatro		
	cmp al,bl
	jb pj4Mayor6				; el resultado mayor se almacena enu otra variable
	cmp bl,al
	jb pj3Mayor6

	mov [mayor2],al
	jmp terceraComparacion6


pj4Mayor6:
	mov al,[puntajeJ4]
	mov [mayor2],al
	jmp terceraComparacion6

pj3Mayor6:
	mov al,[puntajeJ3]
	mov [mayor2],al
	jmp terceraComparacion6

terceraComparacion6:
	mov al,[mayor1]				; se hace una comparacion de las dos variables para saber 
	mov bl,[mayor2]				  ; cual es la mayor
	cmp al,bl
	jb ganarMayor26
	cmp bl,al
	jb ganarMayor16
	escribe guion,lenGuion
	escribe empate,lenEmpate  ; si fuesesn iguales imprime empate
	escribe guion,lenGuion
	jmp revancha16

ganarMayor26:
	mov al,[puntajeJ1]				; la variable mayor se va comparando con cada uno  de los puntajes;
	mov bl,[mayor2]					; asi se sabra cual de los 4 jugadores ha ganado
	cmp al,bl
	je jugadorUnoGana6

	mov al,[puntajeJ2]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorDosGana6

	mov al,[puntajeJ3]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorTresGana6

	mov al,[puntajeJ4]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorCuatroGana6	
	
	jmp revancha16

ganarMayor16:
	mov al,[puntajeJ1]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorUnoGana6			; la variable mayor se va comparando con cada uno  de los puntajes;
								; asi se sabra cual de los 4 jugadores ha ganado
	mov al,[puntajeJ2]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorDosGana6

	mov al,[puntajeJ3]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorTresGana6

	mov al,[puntajeJ4]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorCuatroGana6	
	
	jmp revancha16


jugadorUnoGana6:						; se imprime cual ha ganado
	escribe guion,lenGuion
	escribe ganaM1,lenM1
	escribe guion,lenGuion
	jmp revancha16
jugadorDosGana6:
	escribe guion,lenGuion
	escribe ganaM2,lenM2
	escribe guion,lenGuion
	jmp revancha16
jugadorTresGana6:
	escribe guion,lenGuion
	escribe ganaM3,lenM3
	escribe guion,lenGuion
	jmp revancha16
jugadorCuatroGana6:
	escribe guion,lenGuion
	escribe ganaM4,lenM4
	escribe guion,lenGuion
	jmp revancha16





revancha16:
	escribe msgRevancha,lenRevancha ; se le pregunta al usuario si quiere volver a jugar
	mov eax,3 ; sysread
	mov ebx,0 ; entrada del sistema
	mov ecx,res ; se alamacena en res
	mov edx,2 ; tamano de la reserva
	int 0x80

	mov al,[res]
	sub al,'0'
	cmp al,1; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je inicializarTableroMatriz6
	cmp al,2; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je _start6
	jmp salir ; en caso de que no sea asi se sale del juego

_start6:
	call inicializarTableroMatriz06
	jmp _start

inicializarTableroMatriz6:
	call inicializarTableroMatriz06
	jmp inicioMatriz6


inicializarTableroMatriz06:
	mov esi,0
	jmp inicializarTablero01Matriz6

; si es un punto se mantiene si contiene raya o letra se cambia por un espacio vacio

inicializarTablero01Matriz6:
	mov al,[matrizSeis+esi]
	cmp al,254 ; se hace una comparacion de la posicion del arreglo con 254 que seria un punto 
	je avanceMatriz6 ; en caso de que sea igual
	mov al,-16; se cambia el contenido de la poscion de la matriz por vacio que es igual a -16
	mov [matrizSeis+esi],al
	add esi,1
	cmp esi,121 ; se hace una comparacion con 49 lo cual significara que ya recorrio toda la matriz
	jb inicializarTablero01Matriz6 ; este caso es para una matriz de 6 por 6
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [contadorGane],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ2],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ3],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ4],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor2],al
	ret

avanceMatriz6:
	add esi,1 ; se le suma al contador y vuelve a la etiqueta
	jmp inicializarTablero01Matriz6
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MATRIZ DE 8 POR 8




inicioMatriz8: 

; se hara lo de los turnos en caso de que sean dos jugadores
mov al,[jugadores] ; puede ser dos o tres
cmp al,2
je matriz8DosJugadores

cmp al,3
je matriz8DosJugadores1

;si son cuatro jugadores
mov al,[turnoDosJugadores]
cmp al,0
je primerTurnoMatriz8AA ; si es cero significa que va el jugador uno 
cmp al,1
je segundoTurnoMatriz8AA
cmp al,2
je tercerTurnoMatriz8AA
escribe turno4,lenTurno4

jmp inicio1Matriz8

primerTurnoMatriz8AA:
	escribe turno1,lenTurno1
	jmp inicio1Matriz8

segundoTurnoMatriz8AA:
	escribe turno2,lenTurno2
	jmp inicio1Matriz8

tercerTurnoMatriz8AA:
	escribe turno3,lenTurno3
	jmp inicio1Matriz8

matriz8DosJugadores1: ;;;;;;;;;;;;;;;;si son 3 jugadores
	mov al,[turnoDosJugadores]
	cmp al,0
	je primerTurnoMatriz8A ; si es cero significa que va el jugador uno 
	cmp al,1
	je segundoTurnoMatriz8A
	escribe turno3,lenTurno3
	jmp inicio1Matriz8

	primerTurnoMatriz8A:
		escribe turno1,lenTurno1
		jmp inicio1Matriz8

	segundoTurnoMatriz8A:
		escribe turno2,lenTurno2
		jmp inicio1Matriz8



matriz8DosJugadores:; si es dos jugadores
	mov al,[turnoDosJugadores]

	cmp al,0
	je primerTurnoMatriz8 ; si es cero significa que va el jugador uno 
	escribe turno2,lenTurno2
	jmp inicio1Matriz8


	primerTurnoMatriz8:
		escribe turno1,lenTurno1
		jmp inicio1Matriz8
		



;funcio la cual requiere de un contador  que ira imprimiendo las columnas
; del 0 al 6 en una matriz de 6 por 6
inicio1Matriz8:
escribe saltoLinea,lenSalto
escribe espacio1,lenEspacio1

mov esi,17
imprimeColumnasMatriz8:
	add esi,'0' ; se le suma '0' para convertirlo a ascii
	mov [res],esi ; se mueve al contednido de la variable no inicializada
	escribe res,2 ; se imprime
	escribe espacio,lenEspacio ; se iran imprimiendo espacios luego de cada digito
	sub esi,'0'; se le resta para poder manipularlo e irle sumando 
	add esi,1
	cmp esi,32 ; comparacion entre el contador y 28
	jb imprimeColumnasMatriz8 ; cuando llegue a 28 se detendra 
	escribe saltoLinea,lenSalto ; luego imprime un salto de linea usando el 0xA




	mov eax,0 ; se utilizaran como contadores para imprimir las filas y tambien para imprimir la matriz
	mov edi,0
	
	push eax  ; se introduce en pila en valor de eax para luego utilizarlo
	mov al,[arregloOcho+eax] ; se usa eax como contador y asi recorrer el arreglo que contiene 
	add al,'0'  				; los numeros de las filas en una matriz 6 por 6
	mov [resArreglo],al ; los numeros de filas se iran imprimiendo almacenandolos en resArreglo
	
	escribe resArreglo,2 ; escribe el numero de la primer fila
	

	
	escribe espacio1,lenEspacio1


	mov esi,0
	mov edi,0

; funcion en la cual se imprime el arreglo en forma de matriz de 4 por 4 
; hay dos contadores cuando uno llegue a 11 se hara un cambio de linea;
; el quince significa que ya completo todo los espacios en una linea
; el -2 significa un punto mas 48 y el -16  un espacio en blanco mas 48
; el segundo contador llevara la cuenta al llegar a 121 habra impreso
; todo el contenido del arreglo

	imprimeMatriz8:

		mov al,[matrizOcho+esi] ; esi se encarga de ir recorriendo la matriz 
		add al,'0'
		mov [res],al
		
		escribe res,2
		escribe espacio,lenEspacio
		;escribe espacio,lenEspacio
		add edi,1
		add esi,1
		cmp edi,15
		jb imprimeMatriz8
		escribe saltoLinea,lenSalto

		pop eax ; se hace un pop para no alterar el valor de eax
		add eax,1
		push eax ; luego un push para guardar su valor actual al sumarle uno en pila
		mov al,[arregloOcho+eax] ; se imprime el numero de fila
		add al,'0'
		mov [resArreglo],al

		escribe resArreglo,2

		escribe espacio1,lenEspacio1
		mov edi,0
		cmp esi,225 ; comparacion para saber si ya ha recorrido toda la matriz
		jb imprimeMatriz8
		escribe saltoLinea,lenSalto


	
	
	; funcion la que se imprime un mensaje solicitando la fila en donde se encuentra
	; la linea que va colocar el jugador y luego ese digito que ingresa se guarda en res y
	; es subido a la pila como entero
	; luego se imprime un mensaje solicitando la columna donde se encuentra la linea que va colocar
	; el numero que digito o ingreso se sube como entero la pila
	; para luego almacenar en fila  y columna (Variables no inicializadas); y lograr aplicar formula
	; que es fila por quince (en este caso q es una matriz de 4 por 4) mas columna 

	; verifica que el numero que se introduce para la fila sea de un digito o 
	; de dos en caso de que sea de dos se introduce a la pila se multiplica por 10 la primer pos del res
; y luego se le suma la segunda posicion del res

	moverMatriz8:
		escribe msg3,len3 ; se imprime digite el numero de fila 
		mov eax,3 ; sysread
		mov ebx,0 ; va ser una entrada en el sistema
		mov ecx,res1 ; puntero a  la reserva no inicializada
		mov edx,3 ; tamano de la reserva
		int 0x80
		mov al,[res1+1]
		sub al,'0'	
		cmp al,218 ; se compara si el segundo digito del es vacio o no
		je procesoNormalMatriz8 ; en caso de que si es que el numero contiene solo un digito
		
		mov al,[res1]  ; si contiene dos el primer digito se introduce a la pila posicion cero
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]
		fild dword[diez]  ; luego se multiplica por 10
		fmul st1
		mov al,[res1+1] ; 
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce el segundo digito del res y se suma con lo dado por la multiplicacion
		fadd st1
		fistp dword[arregloColumnas]
		fistp dword[basura]
		fistp dword[basura]  ; se vacea la pila

		fild dword[arregloColumnas]
		
		jmp proceso1Matriz8

		procesoNormalMatriz8:; si solo contiene un digito se introduce a la pila sin ningun tipo de operacion
			mov al,[res1]
			sub al,'0'
			mov [arregloColumnas],al
			fild dword[arregloColumnas] ; se introduce como entero el valor de res que introdujo el usuario

		
	; verifica que el numero que se introduce para la columna sea de un digito o 
	; de dos en caso de que sea de dos se introduce a la pila se multiplica por 10 la primer pos del res
; y luego se le suma la segunda posicion del res	
	proceso1Matriz8:

		escribe msg4,len4; se imprime digite el numero de fila 
		mov eax,3; sysread
		mov ebx,0; va ser una entrada en el sistema
		mov ecx,res1; puntero a  la reserva no inicializada
		mov edx,3; tamano de la reserva
		int 0x80

		mov al,[res1+1]
		sub al,'0'	
		cmp al,218; se compara si el segundo digito del es vacio o no
		je procesoNormal2Matriz8; en caso de que si es que el numero contiene solo un digito
		
		mov al,[res1]; si contiene dos el primer digito se introduce a la pila posicion cero
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]
		fild dword[diez]; luego se multiplica por 10
		fmul st1
		mov al,[res1+1]
		sub al,'0'
		mov [arregloColumnas],al
		fild dword[arregloColumnas]; se introduce el segundo digito del res y se suma con lo dado por la multiplicacion
		fadd st1
		fistp dword[arregloColumnas]
		fistp dword[basura]
		fistp dword[basura] ; se vacea la pila

		fild dword[arregloColumnas]
		
		jmp finProcesoMatriz8

	procesoNormal2Matriz8: ; si solo contiene un digito se introduce a la pila sin ningun tipo de operacion
			mov al,[res1]
			sub al,'0'
			mov [arregloColumnas],al
			fild dword[arregloColumnas]  ; se termina de meter la fila y columna de la raya
			jmp finProcesoMatriz8 

	finProcesoMatriz8:
		fistp dword[columna] ; el valor de columna se almacena en la variable columna
		fistp dword[fila]; el valor de columna se almacena en la variable columna

		; ahora se hara la comparacion de la fila si es par o no
		

		mov al,[fila]
		mov [arregloColumnas],al
		fild dword[arregloColumnas] ; se introduce el valor de fila como entero
		fild dword[numero15] ; se introduce el quince para hacer la multiplicacion
		fmul st1

		mov al,[columna]
		mov [arregloColumnas],al
		fild dword[arregloColumnas]  ; se introduce el valor de la columna
		fadd st0,st1 ; se suma el valor de la multiplicacion con la columna

		fistp dword[res1]  ; resultado esta en res1
		fistp dword[basura]; se vacea la pila
		fistp dword[basura]

		mov esi,[res1] ; se mueve el contenido de res1 (lo que dio la formula fila por 7 mas columna) a esi
		;fild dword[res1]
		;fild dword[matriz+1]
		mov al,[matrizOcho+esi]  ; se verifica que la posicion elegida sea un espacio vacio
		cmp al,240 ; el 240 es igual a un espacio en blanco
		je sigueMatriz8 ; en caso de que si brinca a la etiqueta sigue
		jmp moverMatriz8 ; si no fuese asi se devuelve a solicitar numero de fila y columna correcto

	sigueMatriz8:
		mov al,0
		mov bl,[fila]

		jmp comparaFilaMatriz8

		; se hace un ciclo en el que se compara si la fila es par o no 
		; se usa un contador que inicia en cero y se le ira sumando 2 cada ocasion
		comparaFilaMatriz8:
			;fild dword[arregloColumnas]
			cmp al,bl
			je pares1Matriz8
			add al,2
			cmp al,15 ; finaliza cuando llega a quince se pone este numero por que se trabaja en una 4 por 4
			jb comparaFilaMatriz8
			jmp impares1Matriz8

	
		pares1Matriz8:
			;fild dword[columna]
			mov bl,1; se usa un contador que inicia en uno
			mov al,[columna] ; se mueve lo que contiene columna al registo al
			jmp pares2Matriz8
		
		; como la fila es par segun la logica que se ha seguido la columna debera ser impar;
		; ya que se si se coloca una fila par y columna par se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 1 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto

		pares2Matriz8:  
			cmp al,bl
			je paresMatriz8 ; si los datos estan bien  brinca a la etiqueta pares
			add bl,2
			cmp bl,14 ; como es matriz de 6 por 6 al ser fila par su maxima columna colocada podra ser 9
			jb pares2Matriz8
			jmp moverMatriz8



		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 6 por 6, el contador1 y contador2 tambien son usados colocandolos en cero 
		paresMatriz8:
			mov esi,[contadorGane] ;cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1				; se le suma un o al contadorGane al llegar a 60 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 6 por 6


			mov esi,[res1]
			mov al,[horizontal]
			mov [matrizOcho+esi],al ; se coloca la raya en la posicion de la matriz
			
			

			mov al,16  ; se coloca la variable numero con valor 12 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero16],al 
			
			mov al,0  ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzoMatriz8	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete
	
		

		impares1Matriz8:
			;fild dword[columna]
			mov bl,0; se usa un contador que inicia en cero
			mov al,[columna]; se mueve lo que contiene columna al registo al
			jmp impares2Matriz8
		


		; como la fila es impar segun la logica que se ha seguido la columna debera ser par;
		; ya que se si se coloca una fila impar y columna impar se hara una raya en un punto y no es lo que se quiere
		; se hace un ciclo con un contador que inicia en 0 cada vez se le sumara dos si no es igual lo que contiene
		; columna al contador una vez que acabe el ciclo, brincara a mover para que el usuario vuelva a digitar
		;numero de fila y columna correcto
		impares2Matriz8:
			cmp al,bl
			je imparesMatriz8; si los datos estan bien  brinca a la etiqueta impares
			add bl,2
			cmp bl,15
			jb impares2Matriz8
			jmp moverMatriz8


		; funcion en la que se coloca una raya en la posicion ingresada por el usuario; se le suma al contadorGane ya que se 
		; es colocado una raya, la varible numero se coloca en 8 porque ahi inicia verificando si hay cuadro o no , esto en 
		;una matriz 6 por 6, el contador1 y contador2 tambien son usados colocandolos en cero 
		imparesMatriz8:

			mov esi,[contadorGane];cada vez que se coloca una raya sin importar si es horizontal o vertical
 			add esi,1			; se le suma un o al contadorGane al llegar a 60 se acaba el juego porque
 			mov[contadorGane],esi	; no quedaran espacios en blanco ; esto para una matriz de 6 por 6
			
			mov esi,[res1]
			mov al,[vertical]
			mov [matrizOcho+esi],al; se coloca la raya en la posicion de la matriz
			


			mov al,16; se coloca la variable numero con valor 12 asi inicia verificando cuadros desde el inicio de la matriz
			mov[numero16],al
			
		
			mov al,0 ; se coloca en cero cada contador
			mov[contador1],al
			
			mov al,0
			mov[contador2],al
			jmp comienzoMatriz8	; salto a etiqueta comienzo , en donde se verifica si hay cuadro o no ademas en caso de que hubiese se 
			; coloca la letra del jugador que lo complete


	

	;se verifica el contenido del contadorGane en caso de que sea 24 significara que ya no quedan espacion en donde colocar raya
	; por lo que el juego habra terminado , de esta manera brincara a la etiqueta revanca , en donde se le da al usuario la opcion
	; de salir o volver a jugar con los mismos jugadores, si el contadorGane no es 24 brinca a la etiqueta turnos

	ganeMatriz8:
		mov esi,[contadorGane]
 		cmp esi,112; comparacion entre el contenido del contadorGane y 60
 		je revanchaMatriz8
 		jmp turnosMatriz8
 	
 	turnosMatriz8:
 		mov al,[jugadores]
 		cmp al,2
 		je turnoDosMatriz8
		mov al,[jugadores]
		cmp al,3
		je turnoTresMatriz8 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SI SON CUATRO
		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUnoMatriz8BB

 		mov al,[turnoDosJugadores]
 		cmp al,1
 		je igualDosMatriz8BB

 		mov al,[turnoDosJugadores]
 		cmp al,2
 		je igualTresMatriz8BB


 		mov al,[turnoDosJugadores]
 		cmp al,3
 		je igualCuatroMatriz8BB
 		
 	igualUnoMatriz8BB:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8


 	igualDosMatriz8BB:
 		mov al,2
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8

 	igualTresMatriz8BB:
 		mov al,3
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8
 	
 	igualCuatroMatriz8BB:
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8


	turnoTresMatriz8:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;si son tres
 		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUnoMatriz8B

 		mov al,[turnoDosJugadores]
 		cmp al,1
 		je igualDosMatriz8B

 		mov al,[turnoDosJugadores]
 		cmp al,2
 		je igualTresMatriz8B

 	igualUnoMatriz8B:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8


 	igualDosMatriz8B:
 		mov al,2
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8

 	igualTresMatriz8B:
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8




 	turnoDosMatriz8:  ; SI SON DOS jugadores
 		mov al,[turnoDosJugadores]
 		cmp al,0
 		je igualUnoMatriz8
 		mov al,0
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8

 	igualUnoMatriz8:
 		mov al,1
 		mov[turnoDosJugadores],al
 		;fild dword[turnoDosJugadores]
 		jmp inicioMatriz8




; funcion en donde se verifica si hay cuadro o no en casoo de que si se coloca la letra del jugador dentro de el
; se va verificando espacio por espacio iniciando en la posicion 8 del arreglo , se debe ir sumando uno o restando,
;ademas sumando 8 y tambien restando en otros casos

 comienzoMatriz8:
 	;escribe msg5,len5
 	mov al,[contador2] ; cuando el contador2 llegue a 25 significa que ya no quedan espacios por recorrer por lo que brinca a gane 
 	cmp al,49 ; en total se haran nueve cuadros
 	je ganeMatriz8

 	mov al,[contador1] ; cuando el contador uno llegue a 5 significa que viene un cambio de linea por eso se aumenta en ocho
 	cmp al,7
 	je inicializarMatriz8

continuaMatriz8:
 	mov esi,[numero16]
 	;fild dword[numero];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	mov al,[matrizOcho+esi] ; se compara  la posicion de la matriz con vacio el cual significa 240 en caso de que no haya letra brinca a cuadroVacio
 	cmp al,240  ; se compara si esta o no vacio
 	je cuadroVacioMatriz8
 	jmp noCuadroMatriz8 ; si hay letra brincara a noCuadro

 	
 noCuadroMatriz8:
 	mov al,[numero16] ; se le suma dos al contador que se usa para ir recorriendo la matriz asi se ubicara en el otro espacio para luego verificar
 	add al,2
 	mov [numero16],al
 	mov al,[contador1] ; se le suma uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	jmp comienzoMatriz8 ; se brinca al comienzo 


 inicializarMatriz8:
 	mov al,[contador1] ; al llegar a 5 el contador se inicializa en cero y se le suma 12 al contador que se usa para recorrer la matriz
 	mov al,0
 	mov[contador1],al
 	mov al,[numero16]
 	add al,16 ; al sumarle 8 se ubicara en la otra linea en el espacio correspondiente para verificar si hay letra o no
 	mov[numero16],al
 	jmp continuaMatriz8


; aqui se verifica el contenido de turnoDosJugadores si es 0 significa que la letra que ira en el cuadro sera la del 
;jugador uno en caso de que sea 1 sera la letra del jugador2

verificaLetraMatriz8:
	mov al,[jugadores]
	cmp al,2
	je verificaLetraMatriz8A ; SI SON DOS jugadores
	mov al,[jugadores]
	cmp al,3
	je verificaLetraMatriz8B

verificaCuatroOcho:
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igualMatriz88 ; si es igual a cero es jugador uno 
 	
	cmp al,1 
	je igualMatriz882 ; si es igual a  uno es jugador uno
	cmp al,2
	je igualMatriz883
	
	mov al,[puntajeJ4]
 	add al,1
 	mov [puntajeJ4],al
	
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra3]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,2
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz8




igualMatriz883:
	mov al,[puntajeJ3]
 	add al,1
 	mov [puntajeJ3],al
	
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra2]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,1
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz8


 	;fild dword[numero]
 	
 igualMatriz88: ; si es igual a cero
 	mov al,[puntajeJ1]
 	add al,1
 	mov [puntajeJ1],al
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,3
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz8

 igualMatriz882: ; si es igual a uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov [puntajeJ2],al
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,0
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz8






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
verificaLetraMatriz8B:  ; si son tres jugadores
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igualMatriz8 ; si es igual a cero es jugador uno 
 	
	cmp al,1 
	je igualMatriz82 ; si es igual a  uno es jugador uno
	mov al,[puntajeJ3]
 	add al,1
 	mov [puntajeJ3],al
	
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra2]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,1
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz8


 	;fild dword[numero]
 	
 igualMatriz8: ; si es igual a cero
 	mov al,[puntajeJ1]
 	add al,1
 	mov [puntajeJ1],al
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,2
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz8

 igualMatriz82: ; si es igual a uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov [puntajeJ2],al
 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,0
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz8




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;si son dos jugadores
verificaLetraMatriz8A:
	mov al,[turnoDosJugadores]
	cmp al,0 
	je igualMatriz8A ; si es igual a cero es jugador uno
 	mov al,[puntajeJ2]
 	add al,1
 	mov [puntajeJ2],al

 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra1]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl ; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2 ; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1] ; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
	mov al,0
 	mov [turnoDosJugadores],al ; como el turno es del primer jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en cero 
 	jmp comienzoMatriz8


 	;fild dword[numero]
 	
 igualMatriz8A:
 	mov al,[puntajeJ1]
 	add al,1
 	mov [puntajeJ1],al

 	mov esi,[numero16]; se mueve el contenido de la posicion en donde se esta al registro
 	mov bl,[letra]; se mueve el contenido de la letra1 al registro
 	mov [matrizOcho+esi],bl; se coloca la letra en la posicion en la matriz
 	mov al,[numero16]
 	add al,2; se le suma dos a la posicion para que continue el ciclo
 	mov [numero16],al
 	;fild dword[numero]
 	mov al,[contador1]; se le agrega uno a cada contador
 	add al,1
 	mov [contador1],al

 	mov al,[contador2]
 	add al,1
 	mov [contador2],al
 	mov al,1
 	mov [turnoDosJugadores],al; como el turno es del segudno jugador al hacer cuadro continua el mismo por lo que se coloca otra ves
 	; 							turnoDosjugadores en uno
 	jmp comienzoMatriz8
; esta funcion lo que se encarga es de comparar si alrededor del espacio que puede existir letra hay lineas o no
;para ello se le suma uno al inicio, luego se le resta, el siguiente paso es sumarle ocho y al final restarle ocho a la
; posicion de la matriz donde se es ubicado, es importante mencionar que esta posicion ya se es verificada anteriormente
; por lo que es un espacio vacio
; al final si hay lineas en cada extremo brinca a la etiqueta igual o igual1 dependiendo del turno que sea
; alli se coloca la letra en el cuadro

 cuadroVacioMatriz8:
 	fild dword[numero16] ; se introduce la posicion donde se encuentra en la pila
 	fild dword[uno] ; se ingresa el uno
 	fadd st0,st1 ; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]; se vacea la pila
 	mov esi,[res]
 	mov al,[matrizOcho+esi] 
 	cmp al,240; se compara que no haya raya
 	je noCuadroMatriz8  ;; en caso de que no exista rayita  

 	fild dword[uno]; se ingresa el uno
 	fild dword[numero16] ; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizOcho+esi]
 	cmp al,240; se compara que no haya raya
 	je noCuadroMatriz8

 	fild dword[quince]; se ingresa el quince
 	fild dword[numero16]; se introduce la posicion donde se encuentra en la pila
 	fsub st0,st1; se hace la resta
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizOcho+esi]
 	cmp al,240; se compara que no haya raya
 	je  noCuadroMatriz8

 	fild dword[quince]; se ingresa el quince
 	fild dword[numero16]; se introduce la posicion donde se encuentra en la pila
 	fadd st0,st1; se hace la suma
 	fistp dword[res]; el rsultado se almacena en res
 	fistp dword[basura]
 	mov esi,[res]
 	mov al,[matrizOcho+esi]
 	cmp al,240 ;  ; se compara que no haya raya
 	je  noCuadroMatriz8
 	jmp verificaLetraMatriz8  ; si hay cuadro brinca a letras para saber cual de la de los dos jugadores es




;al finalizar el juego se dirige aqui donde se le consulta al usuario si quiere volver a jugar
; en caso de que digite 0 (no)se sale pero si digita  1 se inicializa el tablero como en un inicio con los
;espacios vacios y sin letras, tambien se debe inicializar el contadorGane

revanchaMatriz8:
	mov al,[puntajeJ1]
	mov bl,[puntajeJ2]
	cmp al,bl					; se hace una comparacion del jugador uno con el dos
	jb pj2Mayor8
	cmp bl,al					; el resultado mayor se almacena enu una variable
	jb pj1Mayor8

	mov [mayor1],al
	jmp segundaComparacion8


pj2Mayor8:
	mov al,[puntajeJ2]
	mov [mayor1],al
	jmp segundaComparacion8

pj1Mayor8:
	mov al,[puntajeJ1]
	mov [mayor1],al
	jmp segundaComparacion8

segundaComparacion8:
	mov al,[puntajeJ3]
	mov bl,[puntajeJ4]			; se hace una comparacion del jugador tres con el cuatro		
	cmp al,bl
	jb pj4Mayor8				; el resultado mayor se almacena enu otra variable
	cmp bl,al
	jb pj3Mayor8

	mov [mayor2],al
	jmp terceraComparacion8


pj4Mayor8:
	mov al,[puntajeJ4]
	mov [mayor2],al
	jmp terceraComparacion8

pj3Mayor8:
	mov al,[puntajeJ3]
	mov [mayor2],al
	jmp terceraComparacion8

terceraComparacion8:
	mov al,[mayor1]				; se hace una comparacion de las dos variables para saber 
	mov bl,[mayor2]				  ; cual es la mayor
	cmp al,bl
	jb ganarMayor28
	cmp bl,al
	jb ganarMayor18
	escribe guion,lenGuion
	escribe empate,lenEmpate  ; si fuesesn iguales imprime empate
	escribe guion,lenGuion
	jmp revancha18

ganarMayor28:
	mov al,[puntajeJ1]				; la variable mayor se va comparando con cada uno  de los puntajes;
	mov bl,[mayor2]					; asi se sabra cual de los 4 jugadores ha ganado
	cmp al,bl
	je jugadorUnoGana8

	mov al,[puntajeJ2]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorDosGana8

	mov al,[puntajeJ3]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorTresGana8

	mov al,[puntajeJ4]
	mov bl,[mayor2]
	cmp al,bl
	je jugadorCuatroGana8	
	
	jmp revancha18

ganarMayor18:
	mov al,[puntajeJ1]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorUnoGana8			; la variable mayor se va comparando con cada uno  de los puntajes;
								; asi se sabra cual de los 4 jugadores ha ganado
	mov al,[puntajeJ2]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorDosGana8

	mov al,[puntajeJ3]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorTresGana8

	mov al,[puntajeJ4]
	mov bl,[mayor1]
	cmp al,bl
	je jugadorCuatroGana8	
	
	jmp revancha18


jugadorUnoGana8:						; se imprime cual ha ganado
	escribe guion,lenGuion
	escribe ganaM1,lenM1
	escribe guion,lenGuion
	jmp revancha18
jugadorDosGana8:
	escribe guion,lenGuion
	escribe ganaM2,lenM2
	escribe guion,lenGuion
	jmp revancha18
jugadorTresGana8:
	escribe guion,lenGuion
	escribe ganaM3,lenM3
	escribe guion,lenGuion
	jmp revancha18
jugadorCuatroGana8:
	escribe guion,lenGuion
	escribe ganaM4,lenM4
	escribe guion,lenGuion
	jmp revancha18



revancha18:
	escribe msgRevancha,lenRevancha ; se le pregunta al usuario si quiere volver a jugar
	mov eax,3 ; sysread
	mov ebx,0 ; entrada del sistema
	mov ecx,res ; se alamacena en res
	mov edx,2 ; tamano de la reserva
	int 0x80

	mov al,[res]
	sub al,'0'
	cmp al,1; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je inicializarTableroMatriz8
	cmp al,2; si quiso revancha, se compara con uno para saber si quisio volver a jugar
	je _start8
	jmp salir ; en caso de que no sea asi se sale del juego

_start8:
	call inicializarTableroMatriz08
	jmp _start

inicializarTableroMatriz8:
	call inicializarTableroMatriz08
	jmp inicioMatriz8


inicializarTableroMatriz08:
	mov esi,0
	jmp inicializarTablero01Matriz8



; si es un punto se mantiene si contiene raya o letra se cambia por un espacio vacio

inicializarTablero01Matriz8:
	mov al,[matrizOcho+esi]
	cmp al,254 ; se hace una comparacion de la posicion del arreglo con 254 que seria un punto 
	je avanceMatriz8 ; en caso de que sea igual
	mov al,-16; se cambia el contenido de la poscion de la matriz por vacio que es igual a -16
	mov [matrizOcho+esi],al
	add esi,1
	cmp esi,225 ; se hace una comparacion con 49 lo cual significara que ya recorrio toda la matriz
	jb inicializarTablero01Matriz8 ; este caso es para una matriz de 6 por 6
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [contadorGane],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ2],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ3],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [puntajeJ4],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor1],al
	mov al,0 ;cuando ya haya recorrido el arreglo se inicializa el contadorGane y brinca al inicio
	mov [mayor2],al
	ret

avanceMatriz8:
	add esi,1 ; se le suma al contador y vuelve a la etiqueta
	jmp inicializarTablero01Matriz8
	







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SALIR

salir: ; salida del juego 
;	escribe ganaste,lenGanaste 
	mov eax,1
	int 0x80

