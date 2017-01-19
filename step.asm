INCLUDE P16F84A.INC

CLRW

BSF STATUS,5
MOVLW B'1111'
MOVWF TRISA
MOVLW B'00'
MOVWF TRISB
BCF STATUS,5

START

BULB_OFF
MOVLW B'00'
MOVWF PORTB

;FIRST CONDITION START
BTFSC PORTA,1
GOTO CONDITION1_IS_PIN2_PRESS
GOTO PIN7_LIGHTON

CONDITION1_IS_PIN2_PRESS
BTFSC PORTA,3
GOTO CONDITION1_IS_PIN17_PRESS
GOTO BELL

CONDITION1_IS_PIN17_PRESS
BTFSC PORTA,0
GOTO CONDITION1_IS_PIN1_PRESS
GOTO BELL

CONDITION1_IS_PIN1_PRESS
BTFSC PORTA,2
GOTO BULB_OFF
GOTO BELL
;FIRST CONDITION END


PIN7_LIGHTON
MOVLW B'10'
MOVWF PORTB
CONDITION2_IS_PIN1_PRESS


;SECOND CONDITION START
CONDITION2_IS_PIN1_PRESS
BTFSC PORTA,2
GOTO CONDITION2_IS_PIN2_PRESS
GOTO PIN8_LIGHTON

CONDITION2_IS_PIN2_PRESS
BTFSC PORTA,3
GOTO CONDITION2_IS_PIN17_PRESS
GOTO BELL

CONDITION2_IS_PIN17_PRESS
BTFSC PORTA,0
GOTO CONDITION2_IS_PIN18_PRESS
GOTO BELL

CONDITION2_IS_PIN18_PRESS
BTFSC PORTA,1
GOTO PIN7_LIGHTON
GOTO BELL
;SECOND CONDITION END

PIN8_LIGHTON
MOVLW B'100'
MOVWF PORTB


;THIRD CONDITION START

CONDITION3_IS_PIN17_PRESS
BTFSC PORTA,0
GOTO CONDITION3_IS_PIN2_PRESS
GOTO PIN6_LIGHTON

CONDITION3_IS_PIN2_PRESS
BTFSC PORTA,3
GOTO CONDITION3_IS_PIN18_PRESS
GOTO BELL

CONDITION3_IS_PIN18_PRESS
BTFSC PORTA,1
GOTO START
GOTO BELL

CONDITION3_IS_PIN1_PRESS
BTFSC PORTA,2
GOTO PIN8_LIGHTON
GOTO BELL

;THIRD CONDITION END


PIN6_LIGHTON
MOVLW B'01'
MOVWF PORTB

BELL
MOVLW B'1000'
MOVWF PORTB


END