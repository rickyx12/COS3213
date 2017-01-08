PORTA EQU 05H
PORTB EQU 06H
TRISA EQU 85H
TRISB EQU 86H
STATUS EQU 03H

CLRW

BSF STATUS,5
MOVLW B'0010000' ;test input
MOVWF TRISA
MOVLW B'0000000'
MOVWF TRISB
BCF STATUS,5

CLRF PORTA

START
MOVLW B'0000010' ;actual input
MOVWF PORTA


BTFSC PORTA,1 ;check kung naka zero ung bit1 ng portA
GOTO EIGHT ;kapag naka 1 ung bit1 ng portA execute EIGHT routine [means from bit6 to bit12 naka 1] 
GOTO ZERO ;kapag naka 0 ung bit1 ng portA execute ZERO routine [means from bit6 to bit11 naka 1 tpos yung bit12 naka 0]

;routine para sa 0
ZERO
MOVLW B'011111'
MOVWF PORTB
GOTO START

;routine para sa 8
EIGHT
MOVLW B'1111111'
MOVWF PORTB
GOTO START

END