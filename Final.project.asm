INCLUDE Irvine32.inc

.data
menu BYTE "****HOTEL MANAGEMENT SYSTEM****", 0
menu1 BYTE "1. Single Room Booking", 0
menu2 BYTE "2. Double Room Booking", 0
menu3 BYTE "3. Suite Booking", 0
menu4 BYTE "4. Show Booking Record", 0
menu5 BYTE "5. Cancel Booking", 0
menu6 BYTE "6. Exit", 0
msg2 BYTE "Wrong input.", 0
msg7 BYTE "The total amount is: $", 0
msg8 BYTE "The total number of rooms booked: ", 0
msg9 BYTE "The total number of Single Rooms booked: ", 0
msg10 BYTE "The total number of Double Rooms booked: ", 0
msg11 BYTE "The total number of Suites booked: ", 0
msg12 BYTE "*Booking canceled successfully*", 0
amount DWORD 0
count DWORD 0
r DWORD 0
count_double DWORD 0
b DWORD 0


userInput DWORD ?

.code
main PROC
    ; Initialize text color 
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor

WHILE_LOOP:
    ; Display Menu with colors
    call DisplayColoredMenu

    ; Get user input
    call readInt
    mov userInput, eax
    call Crlf

    ; Now compare
    cmp userInput, 1
    je SINGLE_ROOM
    cmp userInput, 2
    je DOUBLE_ROOM
    cmp userInput, 3
    je SUITE_BOOKING
    cmp userInput, 4
    je BOOKING_RECORD
    cmp userInput, 5
    je CANCEL_BOOKING
    cmp userInput, 6
    je END_PROGRAM

    ; Invalid input
    mov edx, OFFSET msg2
    call WriteString
    call Crlf
    jmp WHILE_LOOP

SINGLE_ROOM:
    call SINGLE_ROOM_BOOKING
    jmp WHILE_LOOP

DOUBLE_ROOM:
    call DOUBLE_ROOM_BOOKING
    jmp WHILE_LOOP

SUITE_BOOKING:
    call SUITE_BOOKING_PROC
    jmp WHILE_LOOP

BOOKING_RECORD:
    call BOOKING_RECORD_DISPLAY
    jmp WHILE_LOOP

CANCEL_BOOKING:
    call CANCEL_BOOKING_RECORD
    jmp WHILE_LOOP

END_PROGRAM:
    ; Cleanup code (if any)
    mov eax, 0
    invoke ExitProcess, 0

main ENDP

DisplayColoredMenu PROC
    ; Display Menu
    mov edx,OFFSET menu
    call WriteString
    call crlf
    mov edx, OFFSET menu1
    call WriteString
    call Crlf
    mov edx, OFFSET menu2
    call WriteString
    call Crlf
    mov edx, OFFSET menu3
    call WriteString
    call Crlf
    mov edx, OFFSET menu4
    call WriteString
    call Crlf
    mov edx, OFFSET menu5
    call WriteString
    call Crlf
    mov edx, OFFSET menu6
    call WriteString
    call Crlf

    ret
DisplayColoredMenu ENDP

SINGLE_ROOM_BOOKING PROC
    ; Set text color to green
    mov eax, GREEN + (BLACK * 16)
    call SetTextColor

    cmp count, 8
    jge SINGLE_ROOM_END

    mov eax, 100 ; Assuming cost for a single room is 100
    add amount, eax
    inc count
    inc r

SINGLE_ROOM_END:
    ; Reset text color to bright white on blue
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor
    ret
SINGLE_ROOM_BOOKING ENDP

DOUBLE_ROOM_BOOKING PROC
    ; Set text color to green
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor

    cmp count, 8
    jge DOUBLE_ROOM_END

    mov eax, 200 ; Assuming cost for a double room is 200
    add amount, eax
    inc count
    inc count_double 

DOUBLE_ROOM_END:
    ; Reset text color to bright YELLOW on BLACK
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor
    ret
DOUBLE_ROOM_BOOKING ENDP

SUITE_BOOKING_PROC PROC
    ; Set text color to green
    mov eax, GREEN + (BLACK * 16)
    call SetTextColor

    cmp count, 8
    jge SUITE_BOOKING_END

    mov eax, 300 ; Assuming cost for a suite is 300
    add amount, eax
    inc count
    inc b

SUITE_BOOKING_END:
    ; Reset text color to bright yellow on black
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor
    ret
SUITE_BOOKING_PROC ENDP

BOOKING_RECORD_DISPLAY PROC
    ; Set text color to green
    mov eax, GREEN + (BLACK * 16)
    call SetTextColor

    mov edx, OFFSET msg7
    call WriteString
    mov eax, amount
    call WriteDec
    call Crlf

    mov edx, OFFSET msg8
    call WriteString
    mov eax, count
    call WriteDec
    call Crlf

    mov edx, OFFSET msg9
    call WriteString
    mov eax, r
    call WriteDec
    call Crlf

    mov edx, OFFSET msg10
    call WriteString
    mov eax, count_double 
    call WriteDec
    call Crlf

    mov edx, OFFSET msg11
    call WriteString
    mov eax, b
    call WriteDec
    call Crlf
    call Crlf

    ; Reset text color to bright yellow on black
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor

    ret
BOOKING_RECORD_DISPLAY ENDP

CANCEL_BOOKING_RECORD PROC
    ; Set text color to green
    mov eax, GREEN + (BLACK * 16)
    call SetTextColor

    mov r, 0
    mov count_double, 0 
    mov b, 0
    mov amount, 0
    mov count, 0

    mov edx, OFFSET msg12
    call WriteString
    call Crlf

    ; Reset text color to bright yellow on black
    mov eax, YELLOW + (BLACK * 16)
    call SetTextColor

    ret
CANCEL_BOOKING_RECORD ENDP

END main
