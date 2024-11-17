.model small
.stack 0100h
.data

first_command db "Please Enter Your Name : $"
second_command db "UserName : $"
leaderboard db "LeaderBoard $"
highestline db "Top Score: $"
exitgameline db 'Exit Game (E) $'
resumegame db 'Resume Game (R) $'
mainmenuline  db 'Main Menu (M) $'
scoreline db 'Score : $'
Scoreboardline db 'SCOREBOARD $'
scoreboardtotalline db 'Total : $'
scoreboardhitline db 'Hit : $'
totalducksspawn dw 0
gamescoreleft dw 0
Highestscore dw 0
username db 10 dup(?)
buffer db 4 dup(?)             ; Buffer for converting score to ASCII
read_buffer db 255 dup('$') 
valuesfound     dw 0 
gamescorecount  dw 0
spriteinitialx dw 0
spriteinitialy dw 0
spritefinalx dw 0
spritefinaly dw 0

spriteinitialx2 dw 0
spriteinitialy2 dw 0
spritefinalx2 dw 0
spritefinaly2 dw 0

spriteinitialx3 dw 0
spriteinitialy3 dw 0
spritefinalx3 dw 0
spritefinaly3 dw 0


avatar dw 0 
avatarline db 'Choose Your Avatar $'
avatarinitialx dw 0
avatarinitialy dw 0
avatarfinalx dw 0
avatarfinaly dw 0

roundcount dw 0
noofhit dw 0
movx dw 0
movy dw 0
movx1 dw 0
movy1 dw 0
movx2 dw 0
movy2 dw 0
movx3 dw 0
movy3 dw 0
errormsg db 'error $'
allhomers dw 0
coordinates dw 0039,0097,0120,0155,0177,0200,0213,0244,0270,0300
filename db 'SCORES.txt', 0
special_char db ':', '.'

namesize dw 0
counter db 0
x_cor dw 0
y_cor dw 0
bullets dw 3
totalhomer dw 10
videomem equ 0xB800  ; Video memory address
blue_char equ 0x31    ; ASCII code for blue character


marge DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h     ;  3
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;  4
        DB 00h,00h,01h,01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h     ;  5
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  6
        DB 00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;  7
        DB 10h,10h,10h,10h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h     ;  8
        DB 01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h     ; 10
        DB 06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,01h     ; 11
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h     ; 12
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 13
        DB 00h,00h,10h,10h,10h,10h,10h,06h,06h,06h,06h,06h,06h,06h,10h,10h     ; 14
        DB 10h,10h,10h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 15
        DB 01h,01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h     ; 16
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,06h,06h     ; 17
        DB 06h,07h,07h,07h,06h,06h,06h,06h,10h,10h,10h,10h,10h,00h,01h,01h     ; 18
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 19
        DB 01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 20
        DB 00h,00h,10h,10h,10h,10h,06h,06h,06h,07h,07h,07h,07h,07h,06h,06h     ; 21
        DB 06h,10h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 22
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h     ; 23
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,06h,10h,06h,06h,06h     ; 24
        DB 06h,06h,07h,07h,07h,07h,07h,07h,06h,06h,10h,10h,10h,10h,00h,01h     ; 25
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 26
        DB 01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 27
        DB 00h,00h,06h,06h,06h,06h,06h,07h,07h,06h,06h,06h,07h,07h,07h,07h     ; 28
        DB 07h,06h,06h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 29
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h     ; 30
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,00h,06h,06h,06h,06h,06h,07h     ; 31
        DB 07h,07h,07h,06h,06h,06h,07h,07h,07h,06h,06h,10h,10h,10h,00h,01h     ; 32
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 33
        DB 01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 34
        DB 10h,06h,06h,06h,06h,06h,07h,07h,07h,07h,07h,07h,07h,06h,06h,06h     ; 35
        DB 06h,06h,06h,10h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h     ; 36
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h,00h     ; 37
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,06h,06h,06h,06h,07h,07h,07h     ; 38
        DB 07h,07h,07h,07h,07h,07h,07h,07h,06h,06h,10h,10h,10h,10h,10h,00h     ; 39
        DB 00h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 40
        DB 01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 41
        DB 10h,06h,06h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h     ; 42
        DB 06h,06h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,01h,01h,01h,01h     ; 43
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h     ; 44
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,06h,06h,07h,07h,07h,07h     ; 45
        DB 07h,07h,07h,07h,07h,07h,07h,06h,06h,10h,10h,10h,10h,10h,10h,10h     ; 46
        DB 10h,10h,10h,00h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ; 47
        DB 01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 48
        DB 10h,10h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h,06h     ; 49
        DB 06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h     ; 50
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,00h     ; 51
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,06h,06h,06h,07h,07h,07h,07h     ; 52
        DB 07h,07h,07h,07h,07h,06h,06h,06h,07h,06h,06h,06h,06h,06h,10h,10h     ; 53
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,01h,01h,01h,01h,01h,01h,01h     ; 54
        DB 01h,01h,01h,01h,01h,01h,01h,01h,00h,00h,00h,00h,00h,00h,00h,00h     ; 55
        DB 10h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h,06h,06h,06h     ; 56
        DB 07h,07h,07h,07h,06h,06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h     ; 57
        DB 00h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,0Eh,0Eh,0Eh,0Eh,01h     ; 58
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,06h,06h,07h,07h,07h,07h,07h     ; 59
        DB 07h,07h,07h,06h,06h,06h,06h,06h,06h,06h,07h,07h,07h,07h,06h,06h     ; 60
        DB 06h,06h,06h,10h,10h,10h,10h,10h,10h,00h,01h,01h,01h,01h,01h,01h     ; 61
        DB 01h,01h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h     ; 62
        DB 06h,06h,06h,07h,07h,07h,07h,07h,07h,07h,06h,06h,06h,06h,06h,06h     ; 63
        DB 06h,06h,06h,06h,07h,07h,07h,06h,07h,06h,06h,06h,06h,06h,06h,10h     ; 64
        DB 10h,00h,00h,01h,01h,01h,01h,01h,01h,01h,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh     ; 65
        DB 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,07h,07h,07h,07h     ; 66
        DB 06h,06h,06h,06h,06h,06h,06h,10h,10h,06h,06h,06h,06h,06h,06h,06h     ; 67
        DB 07h,06h,07h,06h,06h,06h,06h,08h,10h,10h,00h,01h,01h,01h,01h,01h     ; 68
        DB 01h,01h,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h     ; 69
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,10h,10h     ; 70
        DB 10h,10h,10h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Eh,0Eh,06h     ; 71
        DB 00h,00h,00h,01h,01h,01h,01h,01h,01h,01h,0Eh,0Eh,0Eh,0Fh,0Fh,10h     ; 72
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,06h,06h,06h,06h,06h,06h,06h     ; 73
        DB 06h,06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h     ; 74
        DB 06h,06h,06h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,01h,01h,01h,01h     ; 75
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ; 76
        DB 10h,10h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,10h,10h,10h     ; 77
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,0Eh,0Eh,0Eh     ; 78
        DB 0Eh,10h,10h,0Eh,0Eh,01h,01h,01h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 79
        DB 0Eh,0Eh,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,06h,06h,06h,06h     ; 80
        DB 06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 81
        DB 10h,10h,10h,10h,06h,06h,06h,0Eh,0Eh,0Eh,10h,0Eh,0Eh,01h,01h,01h     ; 82
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ; 83
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 84
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,08h,06h     ; 85
        DB 0Eh,0Eh,10h,10h,0Eh,0Eh,0Eh,06h,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h     ; 86
        DB 0Eh,0Eh,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ; 87
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 88
        DB 10h,10h,10h,10h,10h,10h,10h,10h,06h,0Eh,0Eh,0Eh,10h,0Eh,0Eh,0Eh     ; 89
        DB 0Eh,0Eh,0Eh,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 90
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 91
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 92
        DB 10h,06h,0Eh,0Eh,0Eh,04h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,00h,00h     ; 93
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ; 94
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 95
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,0Eh,0Eh,0Eh,0Eh,0Eh     ; 96
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 97
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 98
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 99
        DB 10h,10h,10h,06h,0Eh,0Eh,0Eh,04h,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h     ;100
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;101
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;102
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,0Eh,0Eh,0Eh     ;103
        DB 0Eh,04h,0Eh,0Eh,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;104
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;105
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;106
        DB 10h,10h,10h,10h,10h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,04h,0Eh,00h,00h,00h     ;107
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;108
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;109
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,0Eh     ;110
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;111
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;112
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;113
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h     ;114
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;115
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;116
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;117
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h     ;118
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;119
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;120
        DB 10h,10h,10h,10h,10h,10h,10h,10h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Ah     ;121
        DB 0Ah,0Ah,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;122
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;123
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;124
        DB 0Ah,0Ah,0Eh,0Eh,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h     ;125
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;126
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;127
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;128
        DB 0Ah,0Ah,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;129
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;130
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;131
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h     ;132
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;133
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;134
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;135
        DB 0Ah,0Ah,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;136
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;137
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;138
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,00h     ;139
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;140
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;141
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;142
        DB 0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;143
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;144
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;145
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,00h     ;146
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;147
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;148
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;149
        DB 0Ah,0Ah,0Ah,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;150
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;151
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;152
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h     ;153
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;154
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;155
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;156
        DB 0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;157
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;158
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;159
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h     ;160
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;161
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;162
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;163
        DB 0Ah,0Ah,0Ah,0Ah,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;164
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;165
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;166
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h     ;167
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;168
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;169
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;170
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;171
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;172
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;173
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h     ;174
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;175
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;176
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;177
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;178
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;179
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;180
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,10h     ;181
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;182
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;183
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;184
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;185
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;186
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;187
        DB 10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,10h     ;188
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;189
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;190
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;191
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;192
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;193
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;194
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,00h     ;195
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;196
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;197
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;198
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;199
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;200
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;201
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,00h     ;202
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;203
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;204
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah     ;205
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;206
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;207
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;208
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h,00h,00h,00h     ;209
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;210
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;211
        DB 10h,10h,10h,10h,10h,10h,10h,10h,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,10h     ;212
        DB 0Ah,0Ah,0Ah,10h,10h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;213
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;214
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;215
        DB 10h,0Ah,0Ah,0Ah,0Ah,10h,10h,10h,0Eh,0Eh,10h,10h,10h,00h,00h,00h     ;216
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;217
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;218
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,0Eh,0Eh,10h,10h,10h,10h     ;219
        DB 0Eh,0Eh,10h,10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;220
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;221
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;222
        DB 10h,10h,0Eh,0Eh,10h,10h,10h,10h,0Eh,0Eh,10h,10h,00h,00h,00h,00h     ;223
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;224
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;225
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,0Eh,0Eh,0Eh,10h,10h,10h,10h     ;226
        DB 0Eh,0Eh,10h,10h,00h,10h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;227
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;228
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;229
        DB 10h,0Eh,0Eh,0Eh,10h,10h,10h,10h,0Eh,0Eh,0Eh,0Eh,10h,10h,10h,00h     ;230
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;231
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;232
        DB 10h,10h,10h,10h,10h,10h,10h,00h,10h,0Eh,0Eh,0Eh,0Eh,10h,10h,10h     ;233
        DB 04h,0Eh,0Eh,0Eh,0Eh,0Eh,04h,04h,10h,10h,10h,10h,10h,10h,10h,10h     ;234
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;235
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;236
        DB 00h,04h,00h,0Eh,0Eh,0Eh,0Eh,04h,04h,04h,04h,04h,04h,04h,04h,04h     ;237
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;238
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;239
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,04h,04h,04h,04h,04h     ;240
        DB 04h,00h,00h,00h,00h,00h,00h,00h

bart DB 10h,10h,10h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,00h,10h     ;  0
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;  1
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;  2
        DB 10h,10h,06h,06h,06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,10h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h     ;  5
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;  6
        DB 10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h,07h,07h,07h,07h,06h     ;  7
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 00h,10h,10h,08h,08h,10h,08h,08h,10h,10h,10h,10h,10h,10h,10h,10h     ; 10
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h     ; 11
        DB 06h,07h,07h,07h,07h,07h,07h,06h,06h,10h,10h,10h,10h,10h,10h,00h     ; 12
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 13
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Eh,08h,08h,0Eh     ; 14
        DB 08h,08h,08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 15
        DB 10h,10h,10h,10h,10h,06h,06h,07h,07h,07h,07h,07h,07h,07h,06h,08h     ; 16
        DB 06h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 17
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 18
        DB 00h,10h,08h,08h,0Eh,08h,0Eh,08h,08h,0Eh,0Eh,08h,10h,10h,10h,10h     ; 19
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,07h,07h     ; 20
        DB 07h,07h,07h,07h,06h,06h,07h,07h,06h,06h,06h,06h,00h,10h,10h,00h     ; 21
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 22
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Eh,0Eh,0Eh,0Eh,08h     ; 23
        DB 0Eh,0Eh,08h,08h,08h,08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 24
        DB 10h,10h,10h,10h,06h,06h,07h,07h,07h,07h,06h,06h,07h,07h,07h,07h     ; 25
        DB 07h,06h,06h,06h,06h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 26
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h     ; 27
        DB 10h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,10h     ; 28
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h,06h     ; 29
        DB 06h,06h,07h,07h,07h,07h,07h,07h,07h,06h,06h,06h,06h,10h,10h,00h     ; 30
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 31
        DB 00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 32
        DB 0Eh,0Eh,0Eh,0Eh,08h,08h,08h,08h,10h,10h,10h,10h,10h,10h,10h,10h     ; 33
        DB 10h,10h,10h,10h,10h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h,07h     ; 34
        DB 07h,07h,06h,06h,06h,06h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 35
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h     ; 36
        DB 08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 37
        DB 08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h     ; 38
        DB 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h,06h,06h,06h,10h,00h     ; 39
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 40
        DB 00h,00h,00h,00h,00h,00h,10h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 41
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,10h,10h,10h,10h,10h,10h,10h,10h     ; 42
        DB 10h,10h,10h,10h,10h,10h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h     ; 43
        DB 07h,07h,07h,06h,06h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 44
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,08h     ; 45
        DB 08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 46
        DB 08h,08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h     ; 47
        DB 06h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h,06h,10h,10h,00h     ; 48
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 49
        DB 00h,00h,00h,10h,10h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 50
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,10h,10h,10h,10h,10h     ; 51
        DB 10h,10h,06h,06h,06h,06h,07h,06h,06h,06h,07h,07h,07h,07h,07h,07h     ; 52
        DB 07h,07h,07h,06h,06h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 53
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Eh,0Eh     ; 54
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 55
        DB 08h,08h,00h,10h,10h,10h,10h,10h,06h,06h,06h,07h,07h,07h,07h,07h     ; 56
        DB 06h,06h,06h,07h,07h,07h,07h,07h,07h,07h,07h,07h,06h,06h,10h,00h     ; 57
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 58
        DB 00h,00h,00h,10h,08h,08h,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 59
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,00h,10h,10h,08h,08h,08h,08h,08h     ; 60
        DB 06h,07h,07h,07h,07h,07h,06h,06h,06h,06h,06h,06h,07h,07h,07h,07h     ; 61
        DB 07h,07h,07h,07h,06h,06h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 62
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Fh,0Fh     ; 63
        DB 0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,00h,00h     ; 64
        DB 00h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,07h,07h,07h,07h,06h,06h,06h,06h     ; 65
        DB 06h,06h,06h,06h,06h,07h,07h,07h,07h,07h,07h,07h,06h,06h,10h,00h     ; 66
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 67
        DB 00h,00h,10h,10h,08h,08h,08h,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 68
        DB 0Eh,0Eh,0Eh,0Eh,08h,00h,00h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,07h,07h     ; 69
        DB 07h,06h,06h,06h,06h,06h,10h,10h,06h,06h,06h,06h,06h,06h,06h,07h     ; 70
        DB 07h,07h,07h,07h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 71
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,08h,08h,08h,08h,0Fh,0Fh     ; 72
        DB 0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,08h,08h,0Eh,0Eh,0Eh,00h,00h,00h,08h,0Eh     ; 73
        DB 0Eh,0Eh,0Eh,0Eh,06h,06h,06h,06h,0Eh,06h,06h,06h,10h,10h,10h,10h     ; 74
        DB 10h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ; 75
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 76
        DB 10h,08h,08h,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h     ; 77
        DB 0Eh,0Eh,08h,00h,00h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,06h,06h,0Eh,0Eh     ; 78
        DB 0Eh,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h,06h,06h,06h     ; 79
        DB 06h,06h,06h,06h,06h,06h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 80
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,00h,08h,08h,07h,0Eh,0Eh,0Eh     ; 81
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,0Eh,0Eh,00h,00h,08h,0Eh,0Eh,0Eh     ; 82
        DB 00h,0Eh,0Eh,0Eh,0Eh,06h,0Eh,0Eh,0Eh,10h,10h,10h,10h,10h,10h,10h     ; 83
        DB 10h,10h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,10h,10h,10h     ; 84
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 85
        DB 10h,10h,00h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 86
        DB 0Eh,0Eh,00h,08h,0Eh,0Eh,0Eh,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,10h     ; 87
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,06h,06h,06h,06h,06h     ; 88
        DB 06h,06h,06h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 89
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,00h,08h,0Eh,0Eh,0Eh,0Eh     ; 90
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,08h,0Eh,0Eh,0Eh,00h,0Eh     ; 91
        DB 0Eh,0Eh,0Eh,08h,08h,08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 92
        DB 10h,10h,10h,10h,06h,06h,06h,06h,06h,10h,10h,10h,10h,10h,10h,00h     ; 93
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 94
        DB 00h,00h,10h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,08h,0Eh,0Eh,0Eh     ; 95
        DB 0Eh,00h,0Eh,0Eh,0Eh,00h,0Eh,0Eh,0Eh,0Eh,08h,10h,10h,10h,10h,10h     ; 96
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ; 97
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 98
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,08h,08h,08h,08h     ; 99
        DB 08h,08h,08h,08h,08h,08h,0Eh,0Eh,0Eh,00h,0Eh,0Eh,00h,0Eh,0Eh,0Eh     ;100
        DB 0Eh,08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;101
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;102
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;103
        DB 00h,00h,00h,10h,10h,10h,10h,10h,00h,08h,08h,08h,08h,0Ch,0Eh,0Eh     ;104
        DB 0Eh,00h,0Eh,00h,0Eh,0Eh,0Eh,0Eh,08h,10h,10h,10h,10h,10h,10h,10h     ;105
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;106
        DB 10h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h     ;107
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h     ;108
        DB 08h,08h,0Ch,0Ch,0Ch,0Ch,0Eh,0Eh,0Eh,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh     ;109
        DB 08h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;110
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;111
        DB 00h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;112
        DB 00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,08h,08h,08h,0Eh,0Eh,07h     ;113
        DB 01h,01h,01h,08h,0Eh,0Eh,0Eh,08h,10h,10h,10h,10h,10h,10h,10h,10h     ;114
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h     ;115
        DB 00h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h     ;116
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h     ;117
        DB 00h,08h,0Eh,0Eh,07h,01h,01h,01h,01h,01h,01h,01h,08h,0Eh,08h,10h     ;118
        DB 10h,10h,10h,00h,00h,00h,00h,10h,10h,10h,00h,00h,00h,00h,00h,10h     ;119
        DB 00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;120
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;121
        DB 00h,00h,00h,00h,00h,00h,00h,10h,00h,08h,08h,01h,01h,01h,01h,01h     ;122
        DB 01h,01h,01h,01h,01h,08h,08h,10h,10h,10h,10h,00h,00h,00h,00h,00h     ;123
        DB 00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;124
        DB 10h,10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h     ;125
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h     ;126
        DB 00h,08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,08h,10h     ;127
        DB 10h,10h,10h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h     ;128
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h     ;129
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;130
        DB 00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,01h,01h,01h,01h,01h,01h     ;131
        DB 01h,01h,01h,01h,08h,08h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h     ;132
        DB 10h,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;133
        DB 10h,10h,10h,10h,10h,00h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;134
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h     ;135
        DB 08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,10h,10h,10h     ;136
        DB 10h,10h,00h,00h,00h,00h,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;137
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h,00h,00h     ;138
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;139
        DB 00h,00h,00h,00h,00h,10h,10h,08h,08h,01h,01h,01h,01h,01h,01h,01h     ;140
        DB 01h,01h,01h,01h,08h,10h,10h,10h,10h,10h,00h,00h,10h,10h,10h,10h     ;141
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;142
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;143
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,08h,08h     ;144
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,10h,10h,10h     ;145
        DB 10h,10h,00h,00h,00h,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;146
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;147
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;148
        DB 00h,00h,00h,00h,10h,08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ;149
        DB 01h,01h,01h,01h,01h,08h,10h,10h,10h,00h,00h,00h,00h,10h,10h,10h     ;150
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h,10h,10h,10h,10h,10h     ;151
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;152
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,01h,01h     ;153
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,10h     ;154
        DB 10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;155
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;156
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;157
        DB 00h,00h,00h,10h,08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ;158
        DB 01h,01h,01h,01h,01h,01h,08h,10h,10h,00h,00h,00h,00h,10h,10h,10h     ;159
        DB 10h,10h,10h,10h,10h,10h,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h     ;160
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;161
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,08h,01h,01h     ;162
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,10h     ;163
        DB 10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;164
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;165
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;166
        DB 00h,10h,08h,08h,08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h     ;167
        DB 01h,01h,01h,01h,01h,01h,08h,10h,10h,00h,00h,00h,00h,10h,10h,10h     ;168
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h     ;169
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;170
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,08h,08h,0Eh,08h,08h,01h     ;171
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,08h,10h,10h     ;172
        DB 10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;173
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;174
        DB 00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,00h     ;175
        DB 10h,08h,08h,0Eh,0Eh,0Eh,08h,08h,01h,01h,01h,01h,01h,01h,01h,01h     ;176
        DB 01h,01h,01h,01h,08h,08h,10h,10h,10h,00h,00h,00h,10h,10h,10h,10h     ;177
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;178
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;179
        DB 10h,02h,02h,02h,02h,02h,10h,10h,10h,08h,08h,0Eh,0Eh,0Eh,06h,08h     ;180
        DB 08h,08h,01h,01h,01h,01h,01h,01h,01h,01h,01h,08h,08h,10h,10h,10h     ;181
        DB 10h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;182
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;183
        DB 00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h     ;184
        DB 02h,09h,09h,0Eh,0Eh,0Eh,00h,08h,00h,00h,08h,08h,01h,01h,01h,01h     ;185
        DB 01h,01h,01h,08h,08h,10h,10h,10h,10h,00h,00h,00h,00h,10h,10h,10h     ;186
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;187
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;188
        DB 0Fh,0Fh,0Fh,0Fh,02h,02h,02h,02h,09h,09h,09h,0Fh,0Eh,0Eh,00h,00h     ;189
        DB 00h,00h,00h,08h,01h,01h,01h,01h,01h,01h,01h,01h,08h,08h,10h,10h     ;190
        DB 10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h,10h     ;191
        DB 10h,10h,10h,10h,10h,10h,00h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;192
        DB 00h,00h,00h,00h,00h,00h,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,02h,02h     ;193
        DB 09h,09h,09h,09h,0Fh,0Eh,00h,00h,00h,00h,00h,00h,00h,01h,01h,01h     ;194
        DB 01h,01h,01h,01h,08h,08h,10h,00h,10h,00h,00h,00h,10h,10h,10h,10h     ;195
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;196
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;197
        DB 02h,02h,02h,02h,0Fh,0Fh,0Fh,02h,02h,09h,09h,09h,09h,0Fh,02h,08h     ;198
        DB 00h,00h,00h,00h,00h,01h,01h,01h,01h,01h,01h,08h,08h,10h,00h,00h     ;199
        DB 00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;200
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;201
        DB 00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,0Fh,0Fh     ;202
        DB 0Fh,02h,09h,09h,09h,09h,02h,02h,02h,00h,00h,00h,00h,00h,01h,01h     ;203
        DB 08h,0Eh,08h,08h,10h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h     ;204
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;205
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;206
        DB 02h,02h,02h,02h,02h,02h,02h,02h,0Fh,0Fh,02h,09h,09h,09h,02h,02h     ;207
        DB 02h,02h,02h,00h,00h,00h,00h,0Eh,0Eh,0Eh,08h,10h,00h,00h,00h,00h     ;208
        DB 00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;209
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;210
        DB 00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h     ;211
        DB 02h,0Fh,0Fh,0Fh,0Fh,02h,02h,02h,02h,02h,02h,02h,08h,00h,00h,0Eh     ;212
        DB 0Eh,0Eh,0Eh,08h,10h,00h,00h,00h,00h,00h,00h,10h,10h,10h,10h,10h     ;213
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;214
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;215
        DB 10h,10h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Fh,0Fh,0Fh,0Fh,0Fh     ;216
        DB 02h,02h,02h,02h,02h,02h,02h,0Eh,0Eh,0Eh,0Eh,08h,10h,10h,00h,00h     ;217
        DB 00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;218
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;219
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,10h,08h,08h,0Ch,0Ch     ;220
        DB 02h,02h,02h,02h,02h,02h,0Fh,0Fh,0Fh,0Fh,02h,02h,02h,02h,02h,02h     ;221
        DB 0Eh,0Eh,0Eh,0Eh,08h,10h,10h,10h,00h,00h,00h,10h,10h,10h,10h,10h     ;222
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;223
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;224
        DB 00h,10h,10h,08h,08h,0Ch,07h,0Ch,0Ch,02h,02h,02h,02h,02h,02h,02h     ;225
        DB 0Fh,0Fh,0Fh,0Fh,02h,09h,09h,09h,0Fh,0Fh,0Eh,0Eh,07h,02h,02h,10h     ;226
        DB 10h,00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;227
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;228
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,0Ch,0Ch,0Ch     ;229
        DB 0Ch,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Fh,0Fh,0Fh,09h,09h,09h     ;230
        DB 09h,09h,0Fh,0Fh,02h,02h,02h,02h,10h,00h,00h,00h,00h,10h,10h,10h     ;231
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,10h,10h     ;232
        DB 10h,10h,00h,00h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;233
        DB 00h,00h,10h,10h,08h,08h,0Ch,0Ch,08h,10h,10h,02h,02h,02h,02h,02h     ;234
        DB 02h,02h,02h,02h,02h,0Fh,09h,09h,09h,09h,09h,09h,02h,02h,02h,02h     ;235
        DB 02h,10h,10h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;236
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;237
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,08h,08h,08h     ;238
        DB 10h,10h,10h,10h,10h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;239
        DB 09h,09h,09h,09h,0Fh,0Fh,02h,02h,02h,10h,00h,00h,00h,10h,10h,10h     ;240
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;241
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;242
        DB 00h,00h,00h,00h,10h,10h,10h,10h,10h,00h,00h,00h,10h,10h,10h,10h     ;243
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,0Fh,0Fh,0Fh     ;244
        DB 0Fh,10h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;245
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h,00h     ;246
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;247
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,02h,02h,02h,02h,02h,02h     ;248
        DB 02h,02h,02h,02h,02h,02h,02h,0Fh,0Fh,10h,00h,00h,00h,10h,10h,10h     ;249
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;250
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;251
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;252
        DB 00h,00h,10h,10h,10h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;253
        DB 02h,10h,00h,00h,10h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;254
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;255
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;256
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,10h,02h,02h     ;257
        DB 01h,0Ch,02h,02h,02h,02h,02h,02h,02h,10h,00h,00h,00h,00h,10h,10h     ;258
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;259
        DB 10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;260
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;261
        DB 00h,00h,00h,00h,10h,00h,00h,0Ch,07h,0Ch,0Ch,02h,02h,02h,02h,02h     ;262
        DB 02h,10h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;263
        DB 10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,00h     ;264
        DB 10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;265
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,10h,00h,00h,0Ch     ;266
        DB 0Ch,0Ch,0Ch,00h,02h,02h,02h,02h,02h,10h,00h,00h,00h,00h,00h,10h     ;267
        DB 00h,00h,00h,00h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h,10h     ;268
        DB 10h,10h,10h,10h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;269
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;270
        DB 00h,00h,00h,00h,10h,10h,00h,00h,0Ch,0Ch,00h,00h,0Ch,0Ch,02h,02h     ;271
        DB 10h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;272
        DB 00h,00h,00h,00h,00h,00h,10h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;273
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;274
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;275
        DB 00h,00h,00h,00h,00h,00h,10h,10h,10h,00h,00h,00h,00h,00h,00h,00h     ;276
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;277
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;278
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;279
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;280
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;281
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;282
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;283
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;284
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;285
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;286
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;287
H db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h     ;;;
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
      
    db 00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h
    db 00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h
    db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h     ;;;;
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

O db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h
    db 00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h
    db 00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h
    db 00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h
    db 00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h




M1 db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h

        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

M2 db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
     
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

E db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
     
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

R db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,00h,00h,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,00h,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h
     
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
     
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

arr6 db 00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,00,00,00,00,00,00,00
    db 04,04,04,04,04,04,04,00,00,00,00,00,00,00,00,00,00,00,00
    db 00,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00
    db 00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,00,00,00,00,00,00,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,00,00,00,00,00,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00

arr7 db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,04,04


arr8 db 00,00,00,00,00,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,00, 00,00,00,00,00,04,04,04,04,04,04,04,04,04,00,00,00,00,00
    db 00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00, 00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00
    db 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00, 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00, 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00, 00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00, 00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00
    db 00,00,00,00,00,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,00, 00,00,00,00,00,04,04,04,04,04,04,04,04,04,00,00,00,00,00


arr9 db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,00,00,04,04,04,04,04,04,04,00,00,04,04,04,04,04,04
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00
    db 00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00
    db 00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00
    db 00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00
    db 00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00


arr10 db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00
    db 00,00,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,00,00,00,00,00,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 00,00,04,04,04,04,04,04,04,00,00,00,00,00,00,00,04,04,04,04,04,04,00,00,00,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04
    db 04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,04,00,04,04,04,04,04,04,04,04,00,00,00,00,00,04,04,04,04,04,04,04


backsign db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,00h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,00h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,04h,04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
    db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
    
levelpt1 db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 04h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 04h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 04h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

levelpt2  db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h
    db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

levelpt3 db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh
    db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

levelpt4 db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

levelpt5 db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,04h
        db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,04h
        db 0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,04h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

levelpt6 db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,04h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,04h
        db 00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,00h,00h,00h,00h,04h
        db 00h,00h,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,04h
        db 00h,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,00h,00h,00h,00h,00h,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,04h
        db 0Bh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Bh,00h,04h
        db 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,04h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h
        db 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h

homer DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,00h,00h,00h,00h,00h,08h,08h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,08h,08h,08h,08h,00h,00h,08h,08h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,08h,00h,00h,00h,00h,08h,08h,08h,08h,00h,00h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,08h,00h,08h,08h,08h,08h,00h,00h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,08h,00h,00h,08h,00h     ;  5
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,06h,06h,08h,08h,00h     ;  6
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh,06h,08h,08h     ;  7
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,0Eh,0Eh,0Eh,00h,00h     ;  8
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh,0Eh,00h,00h,00h     ;  9
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh     ; 10
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 11
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 12
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 13
        DB 00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 14
        DB 00h,00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 15
        DB 00h,00h,00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 16
        DB 00h,00h,00h,00h,00h,06h,08h,08h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 17
        DB 00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Eh,0Eh,0Eh,06h,08h,08h,08h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 18
        DB 00h,00h,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,06h,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 19
        DB 00h,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 20
        DB 00h,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 21
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 22
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,07h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh     ; 23
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,0Fh,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh     ; 24
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,0Eh,0Eh     ; 25
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,08h,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,0Eh,06h     ; 26
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,0Eh,00h,0Eh,08h     ; 27
        DB 00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh,00h,06h,08h     ; 28
        DB 00h,00h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,06h,00h     ; 29
        DB 00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,06h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,0Eh,00h     ; 30
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,0Eh,0Eh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,0Eh,0Eh,0Eh,08h,00h     ; 31
        DB 00h,00h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,07h,08h,08h,08h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,08h,06h,0Eh,08h,00h     ; 32
        DB 00h,00h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,06h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,07h,07h,08h,08h,08h,06h,06h,06h,06h,06h,08h,08h,0Eh,0Eh,06h,0Eh,0Eh,08h,00h     ; 33
        DB 00h,00h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,07h,07h,07h,07h,07h,08h,08h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,0Eh,0Eh,0Eh,06h,08h,00h     ; 34
        DB 08h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,08h,08h,08h,00h,00h     ; 35
        DB 08h,06h,08h,08h,0Eh,0Eh,0Eh,08h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,08h,08h,00h,00h     ; 36
        DB 08h,06h,06h,06h,08h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,00h,00h     ; 37
        DB 08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,06h,00h,00h     ; 38
        DB 08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,08h,00h     ; 39
        DB 08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,08h,08h     ; 40
        DB 08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,0Fh     ; 41
        DB 08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,0Fh     ; 42
        DB 00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,0Fh     ; 43
        DB 00h,00h,08h,08h,08h,08h,08h,08h,06h,06h,06h,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,07h,0Fh     ; 44
        DB 00h,00h,00h,00h,00h,00h,00h,00h,08h,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,01h,01h,01h,04h,04h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,07h     ; 45
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,01h,04h,04h,04h,01h,04h,04h,04h,04h,01h,01h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,07h     ; 46
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,04h,04h,04h,01h,04h,04h,01h,06h,01h,01h,01h,01h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,07h     ; 47
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,04h,04h,04h,04h,04h,01h,06h,06h,06h,01h,01h,01h,06h,06h,06h,06h,08h,08h,0Fh,0Fh,07h     ; 48
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,01h,01h,01h,01h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,0Fh,07h     ; 49
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Fh,0Fh,07h     ; 50
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Eh,0Fh,07h,0Fh     ; 51
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,06h,06h,08h,0Eh,0Fh,0Fh,07h,0Fh     ; 52
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,0Fh,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,0Fh,0Fh,06h,06h,06h,08h,0Eh,0Eh,0Fh,07h,0Fh,0Fh     ; 53
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,0Fh,06h,0Fh,0Fh,0Fh,06h,06h,06h,06h,0Fh,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,08h,08h,0Eh,0Eh,0Fh,0Fh,07h,0Fh,0Fh     ; 54
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,06h,06h,06h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,06h,06h,06h,06h,08h,06h,0Eh,0Eh,0Fh,0Fh,0Fh,07h,0Fh,0Fh     ; 55
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,0Eh,0Eh,07h,0Fh,0Fh,07h,0Fh,0Fh,0Fh     ; 56
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,07h,0Eh,0Fh,07h,0Fh,07h,0Fh,07h,07h     ; 57
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,08h,08h,00h,00h,00h,08h,07h,07h,07h,07h,07h,07h,08h,08h     ; 58
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,08h,08h,08h,08h,08h,08h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,08h,08h,08h,00h,00h     ; 59
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 60
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 61
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 62
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 63


land  DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  0
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  1
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  2
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  3
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  4
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  5
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  6
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  7
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  8
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  9
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 10
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 11
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 12
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 13
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 14
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 15
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 16
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 17
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 18
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 19
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 20
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 21
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 22
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 23
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 24
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 25
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 26
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 27
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 28
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 29
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 30
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 31
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 32
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 33
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 34
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 35
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 36
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 37
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 38
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 39
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 40
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 41
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 42
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 43
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 44
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 45
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 46
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 47
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 48
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 49
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 50
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 51
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 52
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 53
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 54
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 55
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 56
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 57
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 58
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 59
        DB 02h,02h,02h,02h,06h,06h,00h,02h,02h,02h,02h,02h,02h,02h,02h     ; 60
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 61
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 62
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 63
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 64
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 65
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 66
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 67
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 68
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 69
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 70
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 71
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 72
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 73
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 74
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 75
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 76
        DB 06h,06h,06h,06h,06h,06h,00h,00h,02h,02h,02h,02h,02h,02h,02h     ; 77
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 78
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 79
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 80
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 81
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 82
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 83
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 84
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 85
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 86
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 87
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 88
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 89
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 90
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 91
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 92
        DB 02h,02h,02h,02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h     ; 93
        DB 06h,06h,06h,06h,06h,06h,00h,00h,02h,02h,02h,02h,02h,02h,02h     ; 94
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 95
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 96
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 97
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 98
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 99
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;100
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;101
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,02h,02h     ;102
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;103
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;104
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;105
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;106
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;107
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;108
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;109
        DB 02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;110
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h     ;111
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;112
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;113
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;114
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;115
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;116
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;117
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;118
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,02h     ;119
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;120
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;121
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;122
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;123
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;124
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;125
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h,06h     ;126
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;127
        DB 06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,02h,02h,02h,02h,02h     ;128
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;129
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;130
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;131
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;132
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;133
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;134
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;135
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h     ;136
        DB 06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;137
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;138
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;139
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;140
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;141
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;142
        DB 02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;143
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;144
        DB 00h,00h,00h,00h,00h,00h,06h,06h,00h,00h,02h,02h,02h,02h,02h     ;145
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;146
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;147
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;148
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;149
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;150
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;151
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;152
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h     ;153
        DB 06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;154
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;155
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;156
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;157
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;158
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h     ;159
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;160
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;161
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h     ;162
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;163
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;164
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;165
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;166
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;167
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;168
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;169
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;170
        DB 02h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;171
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;172
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;173
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;174
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;175
        DB 02h,02h,02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h     ;176
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;177
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,06h     ;178
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h     ;179
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;180
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;181
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;182
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;183
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;184
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;185
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;186
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;187
        DB 02h,02h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;188
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;189
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;190
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;191
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;192
        DB 02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;193
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;194
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h     ;195
        DB 00h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h     ;196
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;197
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;198
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;199
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;200
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;201
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;202
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;203
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;204
        DB 02h,02h,02h,00h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;205
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;206
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;207
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;208
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h,06h     ;209
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;210
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;211
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h     ;212
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h     ;213
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;214
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;215
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;216
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;217
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;218
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;219
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;220
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;221
        DB 02h,02h,02h,02h,00h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h     ;222
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;223
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;224
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;225
        DB 02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;226
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;227
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;228
        DB 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;229
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h     ;230
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;231
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;232
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;233
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;234
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;235
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;236
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;237
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;238
        DB 02h,02h,02h,02h,02h,00h,06h,06h,02h,02h,02h,02h,02h,02h,02h     ;239
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;240
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;241
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h     ;242
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;243
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;244
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;245
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;246
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,02h     ;247
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;248
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;249
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;250
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;251
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;252
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;253
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;254
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;255
        DB 02h,02h,02h,02h,02h,02h,00h,06h,06h,02h,02h,02h,02h,02h,02h     ;256
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;257
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;258
        DB 02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;259
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;260
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;261
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;262
        DB 06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;263
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h     ;264
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;265
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;266
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;267
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;268
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;269
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;270
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;271
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;272
        DB 02h,02h,02h,02h,02h,02h,02h,00h,00h,06h,02h,02h,02h,02h,02h     ;273
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;274
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;275
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;276
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;277
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;278
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;279
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;280
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;281
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;282
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;283
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;284
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;285
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;286
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;287
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;288
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;289
        DB 02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,02h,02h,02h,02h     ;290
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;291
        DB 02h,02h,02h,02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h     ;292
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;293
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;294
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;295
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;296
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;297
        DB 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h     ;298
        DB 06h,06h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;299
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;300
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;301
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;302
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;303
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;304
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;305
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;306
        DB 02h,02h,02h,06h,02h,02h,02h,02h,02h,00h,00h,00h,02h,02h,02h     ;307
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;308
        DB 02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;309
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;310
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;311
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;312
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;313
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;314
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;315
        DB 06h,06h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;316
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;317
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;318
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;319
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;320
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;321
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;322
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;323
        DB 02h,02h,02h,02h,00h,06h,02h,02h,02h,02h,00h,00h,00h,02h,02h     ;324
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,06h,06h     ;325
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;326
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;327
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;328
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;329
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h     ;330
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;331
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;332
        DB 06h,06h,06h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;333
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;334
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;335
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;336
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;337
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;338
        DB 02h,02h,02h,02h,02h,06h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;339
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h     ;340
        DB 02h,02h,02h,02h,02h,00h,00h,02h,02h,02h,06h,00h,06h,00h,02h     ;341
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h     ;342
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;343
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;344
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;345
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;346
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;347
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;348
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;349
        DB 06h,06h,00h,06h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;350
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;351
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;352
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;353
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;354
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;355
        DB 02h,02h,02h,02h,02h,06h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;356
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;357
        DB 06h,06h,06h,06h,06h,06h,06h,00h,06h,02h,02h,06h,06h,00h,00h     ;358
        DB 06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h     ;359
        DB 00h,00h,06h,06h,06h,06h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;360
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;361
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;362
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;363
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h     ;364
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;365
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h     ;366
        DB 06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,02h,02h,02h,02h,02h     ;367
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;368
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;369
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;370
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;371
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;372
        DB 02h,02h,02h,02h,02h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;373
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;374
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;375
        DB 06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;376
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h     ;377
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;378
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;379
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;380
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;381
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;382
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;383
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;384
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;385
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;386
        DB 06h,06h,06h,06h,06h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h     ;387
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;388
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;389
        DB 02h,02h,02h,02h,02h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;390
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;391
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;392
        DB 06h,06h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;393
        DB 02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;394
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;395
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;396
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;397
        DB 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,00h,00h,00h,00h     ;398
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h     ;399
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;400
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;401
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;402
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;403
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;404
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;405
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;406
        DB 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h     ;407
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;408
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;409
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,02h,02h,02h,02h     ;410
        DB 02h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;411
        DB 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;412
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;413
        DB 06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;414
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;415
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;416
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;417
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;418
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;419
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;420
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;421
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;422
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;423
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;424
        DB 06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;425
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;426
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;427
        DB 06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h     ;428
        DB 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h     ;429
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;430
        DB 06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;431
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;432
        DB 00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;433
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;434
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;435
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;436
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;437
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;438
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;439
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;440
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;441
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;442
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;443
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;444
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,06h     ;445
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;446
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;447
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;448
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;449
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;450
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;451
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;452
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;453
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;454
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;455
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;456
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;457
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;458
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;459
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,06h,06h,06h     ;460
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;461
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;462
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;463
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;464
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;465
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;466
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;467
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;468
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;469
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;470
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;471
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;472
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;473
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;474
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;475
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;476
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ;477
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;478
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;479
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;480
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;481
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;482
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;483
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;484
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;485
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;486
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;487
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;488
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;489
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;490
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;491
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;492
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;493
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;494
        DB 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;495
        DB 06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;496
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;497
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;498
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;499
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;500
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;501
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;502
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;503
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;504
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;505
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;506
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;507
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;508
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;509
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;510
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;511
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;512
        DB 06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h     ;513
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;514
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;515
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;516
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;517
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;518
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;519
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;520
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;521
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;522
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;523
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;524
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;525
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;526
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;527
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;528
        DB 06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;529
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,00h,00h,06h,06h,06h,06h     ;530
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;531
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;532
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;533
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;534
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;535
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;536
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;537
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;538
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;539
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;540
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;541
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;542
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;543
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;544
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;545
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;546
        DB 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;547
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;548
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;549
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;550
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;551
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;552
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;553
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;554
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;555
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;556
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;557
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;558
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;559
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;560
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;561
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;562
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;563
        DB 06h,06h,06h,06h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;564
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;565
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;566
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;567
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;568
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;569
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;570
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;571
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;572
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;573
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;574
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;575
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;576
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;577
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;578
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;579
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;580
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;581
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;582
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;583
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;584
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;585
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;586
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;587
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;588
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;589
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;590
        DB 06h,06h,06h,06h,06h,03h,03h,03h,03h,03h,03h,03h,02h,02h,02h     ;591
        DB 02h,02h,02h,02h,02h,02h,03h,03h,03h,06h,06h,06h,06h,06h,06h     ;592
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;593
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;594
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;595
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;596
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;597
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;598
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;599
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;600
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;601
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;602
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;603
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;604
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;605
        DB 06h,06h,06h,06h,06h,06h,03h,03h,03h,03h,03h,02h,02h,02h,02h     ;606
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;607
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;608
        DB 02h,03h,03h,03h,03h,03h,03h,03h,02h,02h,02h,02h,02h,02h,02h     ;609
        DB 02h,02h,02h,02h,02h,02h,02h,03h,06h,06h,06h,06h,06h,06h,06h     ;610
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;611
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;612
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;613
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;614
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;615
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;616
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;617
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;618
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;619
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;620
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,03h,03h,03h,03h,03h,03h     ;621
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;622
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;623
        DB 02h,02h,02h,03h,03h,03h,03h,06h,06h,06h,06h,06h,06h,06h,06h     ;624
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;625
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;626
        DB 06h,06h,06h,06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h     ;627
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;628
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;629
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;630
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;631
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;632
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;633
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;634
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;635
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,03h,03h,03h,03h     ;636
        DB 03h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;637
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;638
        DB 02h,02h,02h,03h,03h,03h,03h,06h,06h,06h,06h,06h,06h,06h,06h     ;639
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;640
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;641
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;642
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;643
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,06h     ;644
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;645
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;646
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;647
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;648
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;649
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;650
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;651
        DB 06h,06h,03h,03h,03h,03h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;652
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;653
        DB 02h,03h,02h,03h,03h,03h,03h,06h,06h,06h,06h,06h,06h,06h,06h     ;654
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;655
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;656
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;657
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;658
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;659
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;660
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h     ;661
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;662
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;663
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;664
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;665
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;666
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,03h,02h     ;667
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;668
        DB 03h,03h,03h,03h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;669
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;670
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;671
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;672
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;673
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;674
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;675
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;676
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;677
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,03h     ;678
        DB 02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;679
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;680
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;681
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;682
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;683
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;684
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;685
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;686
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;687
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;688
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;689
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;690
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;691
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;692
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;693
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;694
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;695
        DB 02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;696
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;697
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;698
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;699
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;700
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;701
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;702
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;703
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;704
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;705
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;706
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;707
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;708
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;709
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;710
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;711
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;712
        DB 06h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;713
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;714
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;715
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;716
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ;717
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;718
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;719
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;720
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;721
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;722
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;723
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;724
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;725
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;726
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;727
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;728
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;729
        DB 06h,06h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;730
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;731
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;732
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;733
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;734
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;735
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;736
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;737
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;738
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;739
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;740
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;741
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;742
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;743
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;744
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;745
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;746
        DB 06h,06h,06h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;747
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;748
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;749
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;750
        DB 06h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;751
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;752
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;753
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;754
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;755
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;756
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;757
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;758
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;759
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;760
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;761
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;762
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;763
        DB 06h,06h,06h,06h,02h,03h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;764
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;765
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;766
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;767
        DB 06h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;768
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;769
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;770
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;771
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;772
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;773
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;774
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;775
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;776
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;777
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;778
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;779
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;780
        DB 06h,06h,06h,06h,06h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;781
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;782
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;783
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;784
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;785
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;786
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;787
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;788
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;789
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;790
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;791
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;792
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;793
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;794
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;795
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;796
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;797
        DB 06h,06h,06h,06h,06h,06h,02h,06h,06h,06h,06h,06h,06h,06h,06h     ;798
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;799
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;800
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;801
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;802
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;803
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;804
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;805
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;806
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;807
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;808
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;809
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;810
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;811
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;812
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;813
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;814
        DB 06h,06h,06h,06h,06h,06h,06h,02h,06h,06h,06h,06h,06h,06h,06h     ;815
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;816
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;817
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;818
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;819
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;820
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;821
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;822
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;823
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;824
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;825
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;826
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;827
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;828
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;829
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;830
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;831
        DB 06h,06h,06h,06h,06h,06h,06h,06h,02h,06h,06h,06h,06h,06h,06h     ;832
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;833
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;834
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;835
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;836
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;837
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;838
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;839
        DB 06h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;840
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;841
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;842
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;843
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;844
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;845
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;846
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;847
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;848
        DB 06h,06h,06h,06h,06h,06h,06h,06h,03h,02h,06h,06h,06h,06h,06h     ;849
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;850
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;851
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;852
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;853
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;854
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;855
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;856
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;857
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;858
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;859
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;860
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;861
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;862
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;863
        DB 00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;864
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;865
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,06h,06h,06h,06h     ;866
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;867
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;868
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;869
        DB 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,06h,06h,06h,06h,06h     ;870
        DB 06h,06h,06h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;871
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;872
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;873
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;874
        DB 06h,06h,06h,06h,06h,06h,06h,00h,06h,00h,06h,00h,06h,06h,06h     ;875
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;876
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;877
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;878
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;879
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;880
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;881
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;882
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,03h,06h,06h,06h     ;883
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;884
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;885
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;886
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,06h,06h,00h,00h     ;887
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;888
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;889
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;890
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;891
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;892
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;893
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;894
        DB 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h     ;895
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;896
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;897
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;898
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;899
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,06h,06h,06h     ;900
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;901
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;902
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;903
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,06h,06h     ;904
        DB 00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;905
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;906
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;907
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;908
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;909
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;910
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;911
        DB 06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;912
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;913
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;914
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;915
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;916
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,06h,06h     ;917
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;918
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;919
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;920
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,06h     ;921
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;922
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;923
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;924
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;925
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;926
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;927
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;928
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h     ;929
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;930
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;931
        DB 06h,06h,00h,00h,00h,00h,00h,06h,00h,00h,00h,00h,00h,00h,00h     ;932
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,00h     ;933
        DB 06h,06h,00h,06h,06h,06h,06h,06h,06h,00h,06h,06h,06h,02h,06h     ;934
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;935
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;936
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;937
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,06h,06h     ;938
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;939
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;940
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;941
        DB 00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;942
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;943
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;944
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;945
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;946
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;947
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;948
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;949
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;950
        DB 00h,06h,00h,00h,06h,06h,06h,06h,06h,06h,00h,06h,00h,06h,02h     ;951
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;952
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;953
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;954
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h

land2  DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  0
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  1
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  2
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  3
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  4
        DB 02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,00h,00h,00h,02h,02h     ;  5
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  6
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  7
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  8
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;  9
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 10
        DB 02h,02h,02h,02h,02h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h     ; 11
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 12
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 13
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 14
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 15
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 16
        DB 02h,02h,02h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h     ; 17
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 18
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 19
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 20
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 21
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 22
        DB 02h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h     ; 23
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 24
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 25
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 26
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 27
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h     ; 28
        DB 00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 29
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 30
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 31
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 32
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 33
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h     ; 34
        DB 00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 35
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 36
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 37
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 38
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 39
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,00h,00h     ; 40
        DB 00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 41
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 42
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 43
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 44
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 45
        DB 02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,00h,00h,00h,02h     ; 46
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 47
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 48
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 49
        DB 02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 50
        DB 06h,06h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 51
        DB 02h,02h,02h,02h,02h,02h,00h,00h,00h,00h,00h,00h,02h,02h,02h     ; 52
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 53
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 54
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 55
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 56
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 57
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h     ; 58
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 59
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 60
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,06h,06h,06h,06h,06h,06h     ; 61
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 62
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 63
        DB 06h,06h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h     ; 64
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 65
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 66
        DB 02h,02h,02h,04h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ; 67
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 68
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 69
        DB 00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 70
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 71
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 72
        DB 02h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ; 73
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 74
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ; 75
        DB 00h,00h,00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 76
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 77
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h     ; 78
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h     ; 79
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ; 80
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ; 81
        DB 00h,00h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 82
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 83
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,00h     ; 84
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 85
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ; 86
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ; 87
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 88
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 89
        DB 02h,02h,02h,02h,02h,02h,02h,02h,06h,00h,00h,00h,00h,00h,00h     ; 90
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 91
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 92
        DB 00h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,02h,02h     ; 93
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 94
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ; 95
        DB 02h,02h,02h,02h,02h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 96
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 97
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 98
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h     ; 99
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;100
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;101
        DB 02h,02h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;102
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;103
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;104
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,02h,02h,02h,02h,02h,02h     ;105
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;106
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;107
        DB 02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;108
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;109
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;110
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;111
        DB 06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,02h,02h,02h,02h,02h     ;112
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h     ;113
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;114
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;115
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;116
        DB 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;117
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h     ;118
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,00h,00h,00h,00h     ;119
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;120
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;121
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;122
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;123
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;124
        DB 06h,06h,06h,06h,06h,02h,02h,02h,06h,00h,00h,00h,00h,00h,00h     ;125
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;126
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;127
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;128
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;129
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;130
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;131
        DB 06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;132
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;133
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;134
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;135
        DB 00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;136
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;137
        DB 06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;138
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;139
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h     ;140
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;141
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;142
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;143
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h     ;144
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;145
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;146
        DB 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;147
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;148
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;149
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;150
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;151
        DB 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h     ;152
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;153
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;154
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;155
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;156
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ;157
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;158
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;159
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;160
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;161
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;162
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ;163
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;164
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;165
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,06h,06h,00h     ;166
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;167
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;168
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;169
        DB 00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;170
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;171
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;172
        DB 06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;173
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;174
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;175
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;176
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;177
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;178
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;179
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;180
        DB 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,06h     ;181
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;182
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;183
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;184
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;185
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;186
        DB 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;187
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;188
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;189
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;190
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;191
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;192
        DB 06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;193
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;194
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;195
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;196
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;197
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;198
        DB 06h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;199
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;200
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;201
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;202
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;203
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;204
        DB 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;205
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;206
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;207
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;208
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;209
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h     ;210
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;211
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;212
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;213
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;214
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;215
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h     ;216
        DB 00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;217
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;218
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;219
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;220
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;221
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,06h     ;222
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;223
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;224
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;225
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;226
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;227
        DB 06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,06h,06h     ;228
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;229
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;230
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;231
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;232
        DB 03h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h     ;233
        DB 09h,02h,02h,02h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h     ;234
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;235
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;236
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;237
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,02h,02h,02h,09h,06h     ;238
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;239
        DB 06h,06h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h     ;240
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;241
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;242
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;243
        DB 06h,06h,06h,06h,06h,02h,02h,09h,06h,06h,06h,06h,06h,06h,06h     ;244
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;245
        DB 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;246
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;247
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;248
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,09h     ;249
        DB 02h,02h,09h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;250
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h     ;251
        DB 00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;252
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;253
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;254
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,09h,09h,09h,06h,06h,06h     ;255
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;256
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;257
        DB 00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;258
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;259
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;260
        DB 06h,06h,06h,06h,02h,02h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;261
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h     ;262
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ;263
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;264
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;265
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,03h,02h     ;266
        DB 02h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h     ;267
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;268
        DB 00h,00h,00h,00h,06h,06h,06h,00h,00h,00h,00h,00h,00h,06h,06h     ;269
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;270
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;271
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h     ;272
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;273
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;274
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h     ;275
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;276
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;277
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h     ;278
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;279
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;280
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h     ;281
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;282
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;283
        DB 06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;284
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;285
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;286
        DB 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h     ;287
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;288
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;289
        DB 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;290
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;291
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;292
        DB 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;293
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;294
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;295
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;296
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;297
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h     ;298
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;299
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;300
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;301
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;302
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;303
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h     ;304
        DB 00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;305
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;306
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;307
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;308
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h     ;309
        DB 06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h     ;310
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;311
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;312
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;313
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;314
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;315
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;316
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;317
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;318
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;319
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;320
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;321
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;322
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;323
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;324
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;325
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;326
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;327
        DB 00h,00h,00h,00h,00h,00h,00h,00h

ham db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h
    db 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h
    db 00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h
    db 00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h
    db 00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 00h,06h,06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 06h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
    db 06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h

homersprite1 DB 00h,10h,10h,10h,10h,0Eh,0Eh,0Eh,0Eh,08h,08h,08h,08h,08h,00h,00h     ;  0
        DB 00h,10h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,0Eh,08h,08h,00h     ;  1
        DB 10h,00h,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,00h     ;  2
        DB 10h,0Fh,12h,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,00h     ;  3
        DB 10h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,08h,08h,00h     ;  4
        DB 10h,0Eh,0Fh,0Fh,0Fh,12h,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,08h,08h,00h     ;  5
        DB 10h,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh,07h,07h,0Eh,0Eh,0Eh,08h,08h,00h     ;  6
        DB 10h,06h,0Eh,0Eh,07h,07h,07h,07h,08h,08h,0Eh,0Eh,08h,08h,00h,00h     ;  7
        DB 10h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,08h,08h,00h,00h     ;  8
        DB 06h,06h,06h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h,06h,06h,08h,00h,00h,00h     ;  9
        DB 0Fh,0Fh,0Fh,0Fh,10h,10h,04h,04h,06h,0Eh,06h,08h,00h,00h,00h,00h     ; 10
        DB 10h,10h,10h,10h,10h,04h,04h,04h,0Eh,0Eh,06h,08h,00h,00h,00h,00h     ; 11
        DB 10h,10h,10h,10h,04h,04h,04h,0Fh,0Eh,0Eh,06h,08h,00h,00h,00h,00h     ; 12
        DB 10h,10h,08h,0Fh,0Fh,04h,04h,06h,0Eh,0Eh,07h,08h,08h,00h,00h,00h     ; 13
        DB 10h,06h,0Fh,0Fh,0Fh,0Fh,06h,0Eh,0Eh,0Fh,0Fh,0Fh,08h,08h,00h,00h     ; 14
        DB 10h,06h,06h,06h,06h,06h,06h,0Eh,0Fh,0Fh,0Fh,0Fh,08h,08h,00h,00h     ; 15

bullet DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,00h,00h     ;  3
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,08h     ;  4
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,08h     ;  5
        DB 08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h     ;  6
        DB 06h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh,0Eh     ;  7
        DB 0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0Eh     ;  8
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  9
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 10
        DB 00h,0Eh,06h,06h,06h,06h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h     ; 11
        DB 00h,00h,00h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h,00h,00h     ; 12
        DB 00h,00h,00h,06h,06h,06h,06h,06h,06h,00h,00h,00h,00h,00h,00h     ; 13
        DB 00h,00h,00h,00h,00h,06h,00h,00h,06h,00h,00h,00h,00h,00h,00h     ; 14
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 15
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 16
        DB 00h

duck db 00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h,00h
    db 00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h
    db 06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,0Eh,0Eh,0Eh,0Eh,00h
    db 06h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
    db 00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,06h,0Eh,0Eh,0Eh,0Eh,0Eh
    db 00h,00h,0Eh,0Eh,0Eh,06h,06h,06h,06h,0Eh,0Eh,0Eh,0Eh,0Eh,00h
    db 00h,00h,00h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h

deadhomer  DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  0
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  1
        DB 08h,08h,06h,08h,08h,08h,08h,0Eh,0Eh,0Fh,0Fh,0Fh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  2
        DB 08h,06h,08h,06h,06h,06h,0Eh,0Eh,0Fh,10h,0Fh,10h,0Fh,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  3
        DB 08h,06h,08h,06h,06h,06h,0Eh,0Eh,0Fh,0Fh,10h,0Fh,0Fh,0Eh,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ;  4
        DB 06h,08h,08h,06h,06h,06h,0Eh,0Eh,0Fh,10h,0Fh,10h,0Fh,0Eh,0Eh,08h,08h,00h,00h,00h,00h,00h,00h,00h     ;  5
        DB 06h,08h,08h,06h,06h,06h,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,00h,00h,00h,00h,00h,00h     ;  6
        DB 06h,08h,08h,08h,06h,06h,0Eh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,08h,00h,00h,00h,00h,00h,00h     ;  7
        DB 06h,04h,04h,08h,06h,06h,0Eh,0Fh,10h,0Fh,10h,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ;  8
        DB 06h,04h,04h,08h,06h,06h,0Eh,0Fh,0Fh,10h,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ;  9
        DB 06h,08h,04h,08h,06h,0Eh,0Eh,0Fh,10h,0Fh,10h,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ; 10
        DB 0Eh,06h,06h,06h,06h,0Eh,0Eh,0Eh,0Fh,0Fh,0Fh,0Fh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,00h,00h,00h,00h,00h,00h     ; 11
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,06h,0Eh,00h,00h,00h,00h,00h,00h     ; 12
        DB 0Fh,0Eh,0Eh,0Eh,0Eh,06h,0Eh,0Eh,06h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,00h,00h,00h,00h,00h,00h     ; 13
        DB 07h,08h,08h,08h,08h,0Eh,08h,08h,0Eh,06h,0Eh,0Eh,0Eh,0Eh,06h,0Eh,0Eh,08h,00h,00h,00h,00h,00h,00h     ; 14
        DB 07h,08h,00h,00h,00h,08h,08h,08h,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,08h,08h,00h,00h,00h,00h,00h,00h,00h     ; 15
        DB 08h,08h,00h,00h,00h,00h,00h,00h,08h,08h,08h,0Eh,0Eh,0Eh,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 16
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 17
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 18
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 19
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 20
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 21
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 22
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 23



xi dw 0
xf dw 0
yi dw 0
yf dw 0

.code
    mov ax,@data
    mov ds,ax   

    BackTOTitle:  
    
    mov al, 13h            
    mov ah, 00h
    int 10h


    call Gamelogo

    mov si, offset first_command       
    mov dh, 14            ; Row
    mov dl, 9            ; Column

    printing:                          
        mov al, [si]          ; Load character to print
        cmp al , '$'         ; Check if end of string
        je done_printing     ; If
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        
               ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute

        inc si                ; Move to next character
        jmp printing

    done_printing:

    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h

    mov dh, 16            ; Row
    mov dl, 16            ; Column
    mov ah, 02h           ; Set function to set cursor position
    mov bh, 0             ; Page number (default to 0)
    int 10h               ; Set cursor position

    mov si, offset username
    getname:
        mov ah,01
        int 21h
        cmp al ,13
        jz endgetname
        mov [si],al  
        inc si
        inc namesize 
        jmp getname

    endgetname:
    jmp chooseavatar
  

    backtoMenu:
    mov ax, 3			      ; Clearing entire screen
    int 10h

    mov al, 13h            
    mov ah, 00h
    int 10h

    call Gamelogo
    
    call Mainmenu

    mov cx,5
    call secloop

    mov si, offset backsign    ;draw 
    mov yi, 10
    mov yf, 26
    mov xi, 10
    mov xf, 38
    call draw

    mov si, offset second_command       
    mov dh, 11            ; Row
    mov dl, 13           ; Column

    Secondcmd:                          
        mov al, [si]          ; Load character to print
        cmp al , '$'         ; Check if end of string
        je Secondcmddone     ; If
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute

        inc si                ; Move to next character
        jmp Secondcmd

    Secondcmddone:

    mov si, offset username       
    mov dh, 11            ; Row
    mov dl, 25         ; Column

    mov cx,namesize
    printname:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 0100b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        loop printname

    mov si, offset LeaderBoard       
        mov dh, 21           ; Row
        mov dl, 15           ; Column

        mov cx,11
    printhighestline:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute

        inc si                ; Move to next character
        loop printhighestline


        cmp Avatar,0
        je ismarge
        jmp isbart
        avatarprintdone:
        mov ax,0
        mov ax,avatarinitialy
        mov yi,ax
        mov ax,0
        mov ax ,avatarfinaly
        mov yf,ax
        mov ax,0
        mov ax ,avatarinitialx
        mov xi,ax
        mov ax,0
        mov ax ,avatarfinalx
        mov xf,ax   
        call draw

    mov ax,1             
    int 33h


    ello:
    xor bh,bh            
    xor dx,dx
    mov ah,2
    int 10h        
    mov ax,3           
    int 33h              
    cmp bx,1             
    jz check

    jmp ello 


; level 1
level_1:
    
    mov cx,5
    call secloop
    mov bullets,3
    ; mov gamescore,0/


    loop_game:
        mov ax, 3			      ; Clearing entire screen
        int 10h
        mov ax, 13h                           
        int 10h 
        call Terrain
        inc roundcount

        mov cx,0
        mov cx,bullets
        mov yi, 180
        mov yf, 196
        mov xi, 10
        mov xf, 26
        loop_bullets:
            mov si, offset bullet	;draw 
            mov ax,xi
            mov xf,ax
            add xf,16
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_bullets

        mov ax,0
        mov cx,0
        mov cx,totalhomer  
        mov yi, 180
        mov yf, 187
        mov xi, 80
        mov xf, 95     
        loop_ducks:
            mov si, offset duck	;draw   
            mov ax,xi
            mov xf,ax
            add xf,15
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_ducks
    
                   


        mov spriteinitialx, 100
        mov spritefinalx, 116
        mov spriteinitialy,116
        mov spritefinaly,132
        call rndnum
        inc dx
        mov movx,dx
        call rndnum
        inc dx
        mov movy,dx
        call rndnum
        cmp dx,3
        jg nonegx
        neg movx
        nonegx:
        cmp dx,5
        jg noposy
        neg movy
        noposy:
        cmp dx,7
        jg notrndx
        neg movx
        neg movy
        notrndx:
	

        baka:
            mov AH, 06h    ; Scroll up function
            xor AL, AL     ; Clear entire screen
            xor CX, CX     ; Upper left corner CH=row, CL=column
            mov DX, 124FH  ; lower right corner DH=row, DL=column 
            mov BH, 00h    
            int 10H
            mov ax,1             ; show mouse
            int 33h
            mov dx ,offset scoreline
            mov ah,09h
            int 21h

            mov dx, 0
            MOV AX, gamescoreleft
            MOV Bx, 10
            L1:
                mov dx, 0
                CMP Ax, 0
                JE DISP
                DIV Bx
                MOV cx, dx
                PUSH CX
                inc counter
                MOV AH, 0
                JMP L1

            DISP:
                CMP counter, 0
                JE leaveprint
                POP DX
                ADD DX, 48
                MOV AH, 02H
                INT 21H
                dec counter
                JMP DISP
            leaveprint:

            mov si, offset homersprite1 ;draw 
                    mov ax,0
                    mov ax,spriteinitialx
                    mov xi, ax
                    mov ax,0
                    mov ax,spritefinalx
                    mov xf, ax
                    mov ax,0
                    mov ax,spriteinitialy
                    mov yi, ax
                    mov ax,0
                    mov ax,spritefinaly
                    mov yf, ax
                    mov ax,0
                    mov ax,movy
                    add yi, ax
                    add spriteinitialy, ax
                    mov ax,0
                    mov ax,movy
                    add yf, ax
                    add spritefinaly, ax
                    mov ax,0
                    mov ax,movx
                    add xi, ax
                    add spriteinitialx, ax
                    mov ax,0
                    mov ax,movx
                    add xf, ax 
                    add spritefinalx, ax 
                    call draw
            call Checkup
            call Checkright
            call Checkleft
            call Checkdown
            

            mov cx,2
            call secloop

            xor bh,bh            
            xor dx,dx
            mov ah,2
            int 10h        
            mov ax,3           
            int 33h              
            cmp bx,1             
            jz leftbuttonhit

            mov ah, 01h        ; AH = 01h: Check for keystroke without waiting
            int 16h            ; BIOS interrupt to check for keystroke
            jz baka_continue   ; Jump if no key pressed  
            mov ah, 00h        ; AH = 00h: Read keyboard character
            int 16h            ; BIOS interrupt to read keyboard character
            cmp al, 'p'        ; Compare pressed key with 'p'
            je pause           ; Jump if pressed key is 'p'

            baka_continue:

            jmp baka 

        back123:
        cmp bullets,0
        je ranoutofbullets
        call PrintTerrain

        cmp allhomers, 0
        je Perfect_hit
        jmp baka

        jmp loop_game


leftbuttonhit:
call hitcheck
jmp loop_game


level_2:
    
    mov cx,5
    call secloop
    mov bullets,3
    ; mov gamescore,0/


    loop_game2:
        mov ax, 3			      ; Clearing entire screen
        int 10h
        mov ax, 13h                           
        int 10h 
        call Terrain
        inc roundcount

        mov cx,0
        mov cx,bullets
        mov yi, 180
        mov yf, 196
        mov xi, 10
        mov xf, 26
        loop_bulletslvl2:
            mov si, offset bullet	;draw 
            mov ax,xi
            mov xf,ax
            add xf,16
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_bulletslvl2

        mov ax,0
        mov cx,0
        mov cx,totalhomer  
        mov yi, 180
        mov yf, 187
        mov xi, 80
        mov xf, 95     
        loop_duckslvl2:
            mov si, offset duck	;draw   
            mov ax,xi
            mov xf,ax
            add xf,15
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_duckslvl2
    
                   


        mov spriteinitialx, 100
        mov spritefinalx, 116
        mov spriteinitialy,116
        mov spritefinaly,132
        call rndnum
        inc dx
        mov movx1,dx
        call rndnum
        inc dx
        mov movy1,dx
        call rndnum
        cmp dx,3
        jg nonegx1
        neg movx1
        nonegx1:
        cmp dx,5
        jg noposy1
        neg movy1
        noposy1:
        cmp dx,7
        jg notrndx1
        neg movx1
        neg movy1
        notrndx1:

        mov spriteinitialx2, 160
        mov spritefinalx2, 176
        mov spriteinitialy2,116
        mov spritefinaly2,132
        call rndnum
        inc dx
        mov movx2,dx
        call rndnum
        inc dx
        mov movy2,dx
        call rndnum
        cmp dx,3
        jg nonegx2
        neg movx2
        nonegx2:
        cmp dx,5
        jg noposy2
        neg movy2
        noposy2:
        cmp dx,7
        jg notrndx2
        neg movx2
        neg movy2
        notrndx2:

        mov spriteinitialx3, 200
        mov spritefinalx3, 216
        mov spriteinitialy3,116
        mov spritefinaly3,132
        call rndnum
        inc dx
        mov movx3,dx
        call rndnum
        inc dx
        mov movy3,dx
        call rndnum
        cmp dx,3
        jg nonegx3
        neg movx3
        nonegx3:
        cmp dx,5
        jg noposy3
        neg movy3
        noposy3:
        cmp dx,7
        jg notrndx3
        neg movx3
        neg movy3
        notrndx3:
	

        bakalvl2:
            mov AH, 06h    ; Scroll up function
            xor AL, AL     ; Clear entire screen
            xor CX, CX     ; Upper left corner CH=row, CL=column
            mov DX, 124FH  ; lower right corner DH=row, DL=column 
            mov BH, 00h    
            int 10H
            mov ax,1             ; show mouse
            int 33h
            mov dx ,offset scoreline
            mov ah,09h
            int 21h

                mov dx, 0
                MOV AX, gamescoreleft
                MOV Bx, 10
                L1lvl2:
                    mov dx, 0
                    CMP Ax, 0
                    JE DISPlvl2
                    DIV Bx
                    MOV cx, dx
                    PUSH CX
                    inc counter
                    MOV AH, 0
                    JMP L1lvl2

                DISPlvl2:
                    CMP counter, 0
                    JE leaveprintlvl2
                    POP DX
                    ADD DX, 48
                    MOV AH, 02H
                    INT 21H
                    dec counter
                    JMP DISPlvl2
            leaveprintlvl2:

            mov si, offset homersprite1 ;draw 
                    mov ax,0
                    mov ax,spriteinitialx
                    mov xi, ax
                    mov ax,0
                    mov ax,spritefinalx
                    mov xf, ax
                    mov ax,0
                    mov ax,spriteinitialy
                    mov yi, ax
                    mov ax,0
                    mov ax,spritefinaly
                    mov yf, ax
                    mov ax,0
                    mov ax,movy1
                    add yi, ax
                    add spriteinitialy, ax
                    mov ax,0
                    mov ax,movy1
                    add yf, ax
                    add spritefinaly, ax
                    mov ax,0
                    mov ax,movx1
                    add xi, ax
                    add spriteinitialx, ax
                    mov ax,0
                    mov ax,movx1
                    add xf, ax 
                    add spritefinalx, ax 
                    call draw
            call Checkup1
            call Checkright1
            call Checkleft1
            call Checkdown1

            mov si, offset homersprite1 ;draw 
                    mov ax,0
                    mov ax,spriteinitialx2
                    mov xi, ax
                    mov ax,0
                    mov ax,spritefinalx2
                    mov xf, ax
                    mov ax,0
                    mov ax,spriteinitialy2
                    mov yi, ax
                    mov ax,0
                    mov ax,spritefinaly2
                    mov yf, ax
                    mov ax,0
                    mov ax,movy2
                    add yi, ax
                    add spriteinitialy2, ax
                    mov ax,0
                    mov ax,movy2
                    add yf, ax
                    add spritefinaly2, ax
                    mov ax,0
                    mov ax,movx2
                    add xi, ax
                    add spriteinitialx2, ax
                    mov ax,0
                    mov ax,movx2
                    add xf, ax 
                    add spritefinalx2, ax 
                    call draw
            call Checkup2
            call Checkright2
            call Checkleft2
            call Checkdown2

             mov si, offset homersprite1 ;draw 
                    mov ax,0
                    mov ax,spriteinitialx3
                    mov xi, ax
                    mov ax,0
                    mov ax,spritefinalx3
                    mov xf, ax
                    mov ax,0
                    mov ax,spriteinitialy3
                    mov yi, ax
                    mov ax,0
                    mov ax,spritefinaly3
                    mov yf, ax
                    mov ax,0
                    mov ax,movy3
                    add yi, ax
                    add spriteinitialy3, ax
                    mov ax,0
                    mov ax,movy3
                    add yf, ax
                    add spritefinaly3, ax
                    mov ax,0
                    mov ax,movx3
                    add xi, ax
                    add spriteinitialx3, ax
                    mov ax,0
                    mov ax,movx3
                    add xf, ax 
                    add spritefinalx3, ax 
                    call draw
            call Checkup3
            call Checkright3
            call Checkleft3
            call Checkdown3

            mov cx,2
            call secloop

            xor bh,bh            
            xor dx,dx
            mov ah,2
            int 10h        
            mov ax,3           
            int 33h              
            cmp bx,1             
            jz leftbuttonhitlvl2

            mov ah, 01h        ; AH = 01h: Check for keystroke without waiting
            int 16h            ; BIOS interrupt to check for keystroke
            jz baka_continuelvl2   ; Jump if no key pressed
                                ; A key is pressed, check if it's 'p'
            mov ah, 00h        ; AH = 00h: Read keyboard character
            int 16h            ; BIOS interrupt to read keyboard character
            cmp al, 'p'        ; Compare pressed key with 'p'
            je pause           ; Jump if pressed key is 'p'

            baka_continuelvl2:

            jmp bakalvl2 

        back123lvl2:
        cmp bullets,0
        je ranoutofbulletslvl2
        call PrintTerrain

        cmp allhomers, 0
        je Perfect_hit
        jmp bakalvl2

        jmp loop_game2
    



leftbuttonhitlvl2:
call hitchecklvl2
jmp loop_game2


hitchecklvl2 PROC
    shr cx,1

    cmp cx, spriteinitialx      
    jl outofrange1  
    cmp cx, spritefinalx   
    jg outofrange1

    cmp dx, spriteinitialy   
    jl outofrange1  
    cmp dx, spritefinaly     
    jg outofrange1  
    add gamescoreleft,100
    mov bullets,3
    dec totalhomer
    call homerhitdown
    ret

    outofrange1:
    cmp cx, spriteinitialx2      
    jl outofrange2  
    cmp cx, spritefinalx2 
    jg outofrange2

    cmp dx, spriteinitialy2   
    jl outofrange2  
    cmp dx, spritefinaly2     
    jg outofrange2  
    add gamescoreleft,100
    mov bullets,3
    dec totalhomer
    call homerhitdown2
    ret

    outofrange2:
    cmp cx, spriteinitialx3      
    jl outofrange3  
    cmp cx, spritefinalx3   
    jg outofrange3

    cmp dx, spriteinitialy3  
    jl outofrange3  
    cmp dx, spritefinaly3     
    jg outofrange3  
    add gamescoreleft,100
    mov bullets,3
    dec totalhomer
    call homerhitdown3
    ret

    outofrange3:

    mov cx,2
    call secloop
    dec bullets
    sub gamescoreleft,20
    jmp back123lvl2

    ret
hitchecklvl2 ENDP

homerhitdown2 PROC
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h 
    int 10H
    
    mov ax ,spriteinitialx2
    mov xi ,ax
    add ax,24
    mov xf ,ax
    mov ax,0
    mov ax ,spriteinitialy2
    mov yi ,ax
    add ax,24
    mov yf ,ax
    mov ax,0


    homergothit2:
    mov cx,2
    call secloop
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h    
    int 10H
    mov si, offset deadhomer	
    add yi,2
    add yf,2
    call draw
    cmp yf,130
    jg deadhitbottom2
    jmp homergothit2 
    deadhitbottom2:
    inc noofhit
    dec allhomers
    cmp allhomers, 0
    je Perfect_hit
    ret
homerhitdown2 ENDP

homerhitdown3 PROC
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h 
    int 10H
    
    mov ax ,spriteinitialx3
    mov xi ,ax
    add ax,24
    mov xf ,ax
    mov ax,0
    mov ax ,spriteinitialy3
    mov yi ,ax
    add ax,24
    mov yf ,ax
    mov ax,0


    homergothit3:
    mov cx,2
    call secloop
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h    
    int 10H
    mov si, offset deadhomer	
    add yi,2
    add yf,2
    call draw
    cmp yf,130
    jg deadhitbottom3
    jmp homergothit3  
    deadhitbottom3:
    inc noofhit
    dec allhomers
    cmp allhomers, 0
    je Perfect_hit
    ret
homerhitdown3 ENDP


ranoutofbullets:     ;if there are no more bullets left
    mov ax, 3			      ; Clearing entire screen
    int 10h
    mov ax, 13h                           
    int 10h 
    call Terrain

    mov ax,0
        mov cx,0
        mov cx,totalhomer  
        mov yi, 180
        mov yf, 187
        mov xi, 80
        mov xf, 95     
        loop_ducks2:
            mov si, offset duck	;draw   
            mov ax,xi
            mov xf,ax
            add xf,15
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_ducks2

    mov cx,5
    call secloop
    dec allhomers
    cmp allhomers, 0
    je Perfect_hit
    jmp level_1

ranoutofbulletslvl2:     ;if there are no more bullets left
    mov ax, 3			      ; Clearing entire screen
    int 10h
    mov ax, 13h                           
    int 10h 
    call Terrain

    mov ax,0
        mov cx,0
        mov cx,totalhomer  
        mov yi, 180
        mov yf, 187
        mov xi, 80
        mov xf, 95     
        loop_ducks2lvl2:
            mov si, offset duck	;draw   
            mov ax,xi
            mov xf,ax
            add xf,15
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_ducks2lvl2

    mov cx,5
    call secloop
    dec allhomers
    cmp allhomers, 0
    je Perfect_hit
    jmp level_2

check:
call checkback

Perfect_hit:
    call writeinfile
    mov ax, 3			      ; Clearing entire screen
    int 10h
    mov ax, 13h                           
    int 10h 
    mov si, offset Scoreboardline       
        mov dh, 7           ; Row
        mov dl, 14            ; Column

        mov cx,10
    printname1:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute

        inc si                ; Move to next character
        loop printname1
 
        mov si, offset scoreboardtotalline       
        mov dh, 12           ; Row
        mov dl, 15            ; Column
        mov cx ,8
    secondscoreboardcmd:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        loop secondscoreboardcmd

    mov dx, totalducksspawn
    add dx,30h
    mov ah,2
    int 21h

    mov si, offset scoreboardhitline       
        mov dh, 14           ; Row
        mov dl, 16            ; Column
        mov cx,6
    thirdscoreboardcmd:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        loop thirdscoreboardcmd

    mov dx, noofhit
    add dx,30h
    mov ah,2
    int 21h

    mov si, offset scoreline       
        mov dh, 10           ; Row
        mov dl, 14            ; Column
    mov cx,8
    forthscoreboardcmd:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        loop forthscoreboardcmd

        mov dx, 0
        MOV AX, gamescoreleft
        MOV Bx, 10
        loop1:
            mov dx, 0
            CMP Ax, 0
            JE DISP1
            DIV Bx
            MOV cx, dx
            PUSH CX
            inc counter
            MOV AH, 0
            JMP loop1

        DISP1:
            CMP counter, 0
            JE leaveprint2
            POP DX
            ADD DX, 48
            MOV AH, 02H
            INT 21H
            dec counter
            JMP DISP1
    leaveprint2:
    cmp Avatar,0
        je ismarge1
        jmp isbart1
        avatarprintdone1:
        mov ax,0
        mov ax,avatarinitialy
        mov yi,ax
        mov ax,0
        mov ax ,avatarfinaly
        mov yf,ax
        mov ax,0
        mov ax ,avatarinitialx
        mov xi,ax
        mov ax,0
        mov ax ,avatarfinalx
        mov xf,ax   
        call draw

    mov ah, 00h        ; AH = 00h: Read keyboard character
    int 16h            ; BIOS interrupt to read keyboard character
    cmp al,27       ; Compare pressed key with 'p'
    je backtoMenu

rndnum PROC
    mov cx,2
    call secloop
    MOV AH, 00h  ; interrupts to get system time        
    INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

    mov  ax, dx
    mov  dx, 0
    mov  cx, 10 
    div  cx       ; here dx contains the remainder of the division - from 0 to 9

    ret
rndnum ENDP

chooseavatar:
    mov al, 13h            
    mov ah, 00h
    int 10H
    mov ah, 6
    mov al, 0
    mov bh, 12     ;color
    mov ch, 3     ;top row of window
    mov cl, 4     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 4     ;Right most column of window
    int 10h
    mov ch, 3     ;top row of window
    mov cl, 4     ;left most column of window
    mov dh, 3     ;Bottom row of window
    mov dl, 18     ;Right most column of window
    int 10h
    mov ch, 3     ;top row of window
    mov cl, 18     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 18     ;Right most column of window
    int 10h
    mov ch, 20     ;top row of window
    mov cl, 4     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 18     ;Right most column of window
    int 10h
    mov si, offset marge 
                        mov yi, 70
                        mov yf, 139
                        mov xi, 50
                        mov xf, 106
                        call draw

    mov ah, 6
    mov al, 0
    mov bh, 3     ;color
    mov ch, 3     ;top row of window
    mov cl, 22     ;left most column of window
    mov dh, 3     ;Bottom row of window
    mov dl, 36     ;Right most column of window
    int 10h
    mov ch, 3     ;top row of window
    mov cl, 22     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 22     ;Right most column of window
    int 10h
    mov ch, 3     ;top row of window
    mov cl, 36     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 36     ;Right most column of window
    int 10h
    mov ch, 20     ;top row of window
    mov cl, 22     ;left most column of window
    mov dh, 20     ;Bottom row of window
    mov dl, 36     ;Right most column of window
    int 10h
    mov si, offset bart 
                        mov yi, 70
                        mov yf, 134
                        mov xi, 210
                        mov xf, 282
                        call draw

    mov si, offset avatarline       
            mov dh, 1           ; Row
            mov dl, 11           ; Column

            mov cx,18
        avatarlineprint:                          
            mov al, [si]          ; Load character to print
            mov ah, 02h           ; Set function to set cursor position
            mov bh, 0             ; Page number (default to 0)
            int 10h               ; Set cursor position

            mov bl, 1110b         ; Text attribute (light cyan on black background)
            mov ah, 09h           ; Set function to display character and attribute
            inc dl
            int 10h               ; Display character with specified attribute

            inc si                ; Move to next character
            loop avatarlineprint

    mov ax,1             ; show mouse
    int 33h
    mouse:
    xor bh,bh            
    xor dx,dx
    mov ah,2
    int 10h        
    mov ax,3           
    int 33h              
    cmp bx,1             
    jz checkavatar

    jmp mouse 


checkavatar:
    cmp cx, 60      
    jl not_in_marge_range 
    cmp cx, 300     
    jg not_in_marge_range

    cmp dx, 20      
    jl not_in_marge_range  
    cmp dx, 165      
    jg not_in_marge_range  
    mov Avatar,0
    jmp backtoMenu

    not_in_marge_range:
    cmp cx, 350      
    jl not_in_bart_range 
    cmp cx, 590     
    jg not_in_bart_range

    cmp dx, 20      
    jl not_in_bart_range  
    cmp dx, 165      
    jg not_in_bart_range  
    mov Avatar,1
    jmp backtoMenu

    not_in_bart_range:
    jmp mouse

hitcheck PROC 
    shr cx,1

    cmp cx, spriteinitialx      
    jl outofrange  
    cmp cx, spritefinalx   
    jg outofrange

    cmp dx, spriteinitialy   
    jl outofrange  
    cmp dx, spritefinaly     
    jg outofrange  
    add gamescoreleft,100
    mov bullets,3
    dec totalhomer
    call homerhitdown
    ret

    outofrange:
    mov cx,2
    call secloop
    dec bullets
    sub gamescoreleft,20
    jmp back123

    ret
hitcheck ENDP

homerhitdown PROC
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h 
    int 10H
    
    mov ax ,spriteinitialx
    mov xi ,ax
    add ax,24
    mov xf ,ax
    mov ax,0
    mov ax ,spriteinitialy
    mov yi ,ax
    add ax,24
    mov yf ,ax
    mov ax,0


    homergothit:
    mov cx,2
    call secloop
    mov AH, 06h    ; Scroll up function
    xor AL, AL     ; Clear entire screen
    xor CX, CX     ; Upper left corner CH=row, CL=column
    mov DX, 124FH  ; lower right corner DH=row, DL=column 
    mov BH, 00h    
    int 10H
    mov si, offset deadhomer	
    add yi,2
    add yf,2
    call draw
    cmp yf,130
    jg deadhitbottom
    jmp homergothit  
    deadhitbottom:
    inc noofhit
    dec allhomers
    cmp allhomers, 0
    je Perfect_hit
    ret
homerhitdown ENDP

Checkright PROC
    cmp spritefinalx,316
    jg changexdirectionL
    returnchecks1::
    ret

Checkright ENDP

Checkleft PROC
    cmp spriteinitialx,10
    jb changexdirectionR
    returnchecks2::
    ret

Checkleft ENDP

Checkup PROC
    cmp spriteinitialy,10
    jb changeydirectionU
    returnchecks3::
    ret

Checkup ENDP

Checkdown PROC
    cmp spritefinaly,142
    jg changeydirectionD
    returnchecks4::
    ret
Checkdown ENDP

changexdirectionR:
neg movx
jmp returnchecks1

changexdirectionL:
neg movx
jmp returnchecks2

changeydirectionU:
neg movy
jmp returnchecks3

changeydirectionD:
neg movy
jmp returnchecks4


Checkright1 PROC
    cmp spritefinalx,316
    jg changexdirectionL1
    returnchecks21::
    ret

Checkright1 ENDP

Checkleft1 PROC
    cmp spriteinitialx,10
    jb changexdirectionR1
    returnchecks11::
    ret

Checkleft1 ENDP

Checkup1 PROC
    cmp spriteinitialy,10
    jb changeydirectionU1
    returnchecks31::
    ret

Checkup1 ENDP

Checkdown1 PROC
    cmp spritefinaly,142
    jg changeydirectionD1
    returnchecks41::
    ret
Checkdown1 ENDP

changexdirectionR1:
neg movx1
jmp returnchecks11

changexdirectionL1:
neg movx1
jmp returnchecks21

changeydirectionU1:
neg movy1
jmp returnchecks31

changeydirectionD1:
neg movy1
jmp returnchecks41

Checkright2 PROC
    cmp spritefinalx2,316
    jg changexdirectionL2
    returnchecks12::
    ret

Checkright2 ENDP

Checkleft2 PROC
    cmp spriteinitialx2,10
    jb changexdirectionR2
    returnchecks22::
    ret

Checkleft2 ENDP

Checkup2 PROC
    cmp spriteinitialy2,10
    jb changeydirectionU2
    returnchecks32::
    ret

Checkup2 ENDP

Checkdown2 PROC
    cmp spritefinaly2,142
    jg changeydirectionD2
    returnchecks42::
    ret
Checkdown2 ENDP

changexdirectionR2:
neg movx2
jmp returnchecks12

changexdirectionL2:
neg movx2
jmp returnchecks22

changeydirectionU2:
neg movy2
jmp returnchecks32

changeydirectionD2:
neg movy2
jmp returnchecks42


Checkright3 PROC
    cmp spritefinalx3,316
    jg changexdirectionL3
    returnchecks13::
    ret

Checkright3 ENDP

Checkleft3 PROC
    cmp spriteinitialx3,10
    jb changexdirectionR3
    returnchecks23::
    ret

Checkleft3 ENDP

Checkup3 PROC
    cmp spriteinitialy3,10
    jb changeydirectionU3
    returnchecks33::
    ret

Checkup3 ENDP

Checkdown3 PROC
    cmp spritefinaly3,142
    jg changeydirectionD3
    returnchecks43::
    ret
Checkdown3 ENDP

changexdirectionR3:
neg movx3
jmp returnchecks13

changexdirectionL3:
neg movx3
jmp returnchecks23

changeydirectionU3:
neg movy3
jmp returnchecks33

changeydirectionD3:
neg movy3
jmp returnchecks43


SCOREBOARDshow:
    mov ax, 3			      ; Clearing entire screen
    int 10h
    mov ax, 13h                           
    int 10h 

    mov si, offset highestline       
        mov dh, 2           ; Row
        mov dl, 12            ; Column

        mov cx,11
    printhighestline1:                          
        mov al, [si]          ; Load character to print
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        inc dl
        int 10h               ; Display character with specified attribute

        inc si                ; Move to next character
        loop printhighestline1

    call readingfile
    jmp printhighest
    backinmain:

    pop Highestscore

    mov dx, 0
    MOV AX, Highestscore
    MOV Bx, 10h
    highestL1:
        mov dx, 0
        CMP Ax, 0
        JE DISPhighest
        DIV Bx
        MOV cx, dx
        PUSH CX
        inc counter
        MOV AH, 0
        JMP highestL1

    DISPhighest:
        CMP counter, 0
        JE leaveprinthighest
        POP DX
        ADD DX, 48
        MOV AH, 02H
        INT 21H
        dec counter
        JMP DISPhighest
    leaveprinthighest:

    mov si,offset read_buffer
    mov dh, 7           ; Row
    mov dl, 12            ; Column
    
    
    printscores:
        mov al, [si]          ; Load character to print
        cmp al,'$'
        je breakloop  
        cmp al,'.'
        jne skipstep
        inc dh
        inc dh
        mov dl, 12  
        inc si
        jmp printscores
        skipstep:
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position

        mov bl, 0011b         ; Text attribute (light cyan on black background)
        mov ah, 09h           ; Set function to display character and attribute
        int 10h               ; Display character with specified attribute
        inc dl
        inc si 
    jmp printscores

    breakloop:

    call clearscores
    infinite:
    mov ah,00
    int 16h
    cmp al,'e'
    je backtoMenu
    jmp infinite

pause:

    mov si, offset resumegame       
    mov dh, 7           ; Row
    mov dl, 12            ; Column

    firstpausecmd:                          
        mov al, [si]          ; Load character to print
        cmp al , '$'         ; Check if end of string
        je firstlinedone     ; If
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        jmp firstpausecmd

    firstlinedone:

    mov si, offset mainmenuline       
    mov dh, 9           ; Row
    mov dl, 13            ; Column

    secondpausecmd:                          
        mov al, [si]          ; Load character to print
        cmp al , '$'         ; Check if end of string
        je secondlinedone     ; If
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        jmp secondpausecmd

    secondlinedone:

    mov si, offset exitgameline       
    mov dh, 11           ; Row
    mov dl, 13            ; Column

    thirdpausecmd:                          
        mov al, [si]          ; Load character to print
        cmp al , '$'         ; Check if end of string
        je thirdlinedone     ; If
        mov ah, 02h           ; Set function to set cursor position
        mov bh, 0             ; Page number (default to 0)
        int 10h               ; Set cursor position
        mov bl, 1110b         ; Text attribute (light cyan on black background)
        mov ah, 09h    
        inc dl
        int 10h               ; Display character with specified attribute
        inc si                ; Move to next character
        jmp thirdpausecmd

    thirdlinedone:

    inf:
    mov ah,00
    int 16h

    cmp al,'e'
    je exit
    cmp al,'r'
    je loop_game
    cmp al,'m'
    je backtoMenu
    jmp inf

writeinfile PROC
    ; Open the file for writing
    mov ah, 3Dh         ; DOS function to create or open a file
    mov al, 2           ; CX = 1 for write mode
    mov dx,offset filename    ; Load address of FileName into DX
    int 21h              ; Call DOS interrupt

    ; Check if file creation was successful
    jc file_error       ; If carry flag is set, error occurred

    mov bx, ax          ; BX contains file handle returned by previous call

     ; Move file pointer to the end of the file
    mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 ; 0 beginning of file, 2 end of file
    int 21h           ; Call DOS interrupt

    ; Check if file pointer move was successful
    jc file_error       ; If carry flag is set, error occurred

    ; Write player name to the file
    mov ah, 40h         ; DOS function to write to file
    mov cx, namesize  ; Calculate length of username
    mov dx, offset username ; DS:DX points to ASCIIZ buffer
    int 21h            ; Call DOS interrupt

    ; Write special character ':' to indicate end of name
    mov ah, 40h         ; DOS function to write to file
    mov cx,1
    mov dx, OFFSET special_char ; DS:DX points to special character ':'
    int 21h             ; Call DOS interrupt
             

     mov gamescorecount,0
    ; Convert game score to ASCII
    mov ax, gamescoreleft   ; Load game score into AX
    mov si, offset buffer   ; Point SI to buffer
    call int_to_ascii       ; Convert score to ASCII

    ; Write game score to the file
    mov ah, 40h         ; DOS function to write to file
    mov cx, gamescorecount          ; Length of score string (including null terminator)
    mov dx, offset buffer   ; DS:DX points to score buffer
    int 21h              ; Call DOS interrupt

    ; Write special character '.' to indicate end of score
    mov ah, 40h         ; DOS function to write to file
    mov cx,1
    mov dx, OFFSET special_char + 1 ; DS:DX points to special character '.'
    int 21h             ; Call DOS interrupt

    ; Close the file
    mov ah, 3Eh         ; DOS function to close file
    int 21h             ; Call DOS interrupt

    ret

file_error:
    ret

writeinfile ENDP

readingfile PROC
    mov ah, 3DH
    mov al, 0 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset filename
    int 21h

    mov bx,ax

    mov ah, 3FH
    mov cx, 250
    mov dx, offset read_buffer
    int 21h

    mov ah, 3Eh         ; DOS function to close file
    int 21h    
    ret
readingfile ENDP

printhighest:
    mov si,offset read_buffer
    mainloop:
        nameloop:
            mov ax,0
            mov al ,[si]
            inc si
            cmp ax,':'
            je nameend
            cmp ax, '$'
            je readloopend
            jmp nameloop

        nameend:
            xor ax, ax          ; Clear AX (initialize result)
            mov cx, 10h          ; Base 10
            mov bx,0
        loop_start:
            mov bl,[si]              ; Pop digit from stack
            cmp bl,'.'
            je scoreend
            sub bl, '0'         ; Convert ASCII to numeric value
            mul cx
            add ax, bx          ; AX = AX + digit             ; AX = AX * 10
            inc si
            jmp loop_start       ; If not, continue
            scoreend:
            push ax
            inc valuesfound

            jmp mainloop
    readloopend:
    find_max_and_remove:
        pop ax              ; Get the first value from the stack
        mov dx, ax          ; Initialize the maximum value with the first value
        dec valuesfound
        mov cx,valuesfound
    compare_loop:
        pop bx              ; Pop the next value from the stack
        cmp bx, dx          ; Compare the popped value with the current maximum
        jle not_greater     ; If the popped value is not greater, skip update
        mov dx, bx          ; Update the maximum value
    not_greater:
        cmp sp, bp          ; Check if we have reached the bottom of the stack
        loop compare_loop    ; If not, continue comparing
    push dx
jmp backinmain

int_to_ascii:
    mov cx, 10          ; Base 10
    next_digit:
        xor dx, dx          ; Clear DX
        div cx              ; AX = AX / 10, DX = remainder
        add dl, '0'         ; Convert remainder to ASCII
        push dx
        inc gamescorecount         ; Check if quotient is zero
        cmp ax, 0  
        jnz next_digit      ; If not zero, continue

        mov cx,gamescorecount
        extractloop:
        mov dx,0
        pop dx
        mov [si], dl        ; Store ASCII digit in buffer
        inc si   
        loop extractloop
    ret

PrintTerrain PROC
    call Terrain
     mov cx,0
        mov cx,bullets
        mov yi, 180
        mov yf, 196
        mov xi, 10
        mov xf, 26
        loop_bullets2:
            mov si, offset bullet	;draw 
            mov ax,xi
            mov xf,ax
            add xf,16
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_bullets2

        mov ax,0
        mov cx,0
        mov cx,totalhomer  
        mov yi, 180
        mov yf, 187
        mov xi, 80
        mov xf, 95     
        loop_duckssecond:
            mov si, offset duck	;draw   
            mov ax,xi
            mov xf,ax
            add xf,15
            mov ax,0
            push cx
            mov cx,0
            call draw
            pop cx
            mov ax,0
            mov ax,xf
            mov xi,ax
            loop loop_duckssecond
    ret
PrintTerrain ENDP

secloop PROC 
    mov dx, 32  ; Initialize dx to a large value
delay_loop:
    dec dx          ; Decrement dx
    jnz delay_loop  ; If dx is not zero, continue loop
    dec cx          ; Decrement cx
    jnz delay_loop  ; If cx is not zero, continue loop            
    ret
secloop ENDP

Terrain PROC
    
    mov si, offset land	 
					mov yi, 149
					mov yf, 205
					mov xi, 00
					mov xf, 256
					call draw

    mov si, offset land2	 
					mov yi, 149
					mov yf, 205
					mov xi, 232
					mov xf, 320
					call draw
    ret
Terrain ENDP

checkback PROC ;cx = x, dx = y

    cmp cx, 20      
    jl not_in_rangeback  
    cmp cx, 74     
    jg not_in_rangeback

    cmp dx, 10      
    jl not_in_rangeback  
    cmp dx, 25      
    jg not_in_rangeback  
    call clearall
    jmp BackTOTitle

    not_in_rangeback:
    call checklvl1

checkback ENDP

checklvl1 PROC 
    cmp cx, 140      
    jl not_in_rangelvl1  
    cmp cx, 435     
    jg not_in_rangelvl1  

    cmp dx, 110      
    jl not_in_rangelvl1  
    cmp dx, 130      
    jg not_in_rangelvl1  
    mov totalhomer,5
    mov allhomers,5
    mov totalducksspawn,5
    mov gamescoreleft,0
    mov noofhit,0
    jmp level_1
    
    not_in_rangelvl1:
    call checklvl2

checklvl1 ENDP

checklvl2 PROC 
    cmp cx, 130      
    jl not_in_rangelvl2  
    cmp cx, 445     
    jg not_in_rangelvl2  

    cmp dx, 140      
    jl not_in_rangelvl2  
    cmp dx, 160      
    jg not_in_rangelvl2  
    mov totalhomer,5
    mov allhomers,5
    mov totalducksspawn,5
    mov gamescoreleft,0
    mov noofhit,0
    jmp level_2

    not_in_rangelvl2:
    call checkLeaderboard

checklvl2 ENDP

checkLeaderboard PROC
    cmp cx, 190      
    jl not_in_rangeLB 
    cmp cx, 370     
    jg not_in_rangeLB  

    cmp dx, 165      
    jl not_in_rangeLB 
    cmp dx, 175      
    jg not_in_rangeLB 
    jmp SCOREBOARDshow

    not_in_rangeLB:
    jmp ello

    ret
checkLeaderboard ENDP

clearall PROC
    mov cx, 10               ; Set the number of iterations
    mov si, offset username  ; Load SI with the address of username
    mov al, '?'            ; Set the byte to be stored
    mov namesize,0
clear_loop:
    mov [si], al             ; Store '?' at the current address pointed by SI
    inc si                   ; Move to the next byte
    loop clear_loop          ; Continue looping until CX becomes zero
    ret
clearall ENDP

clearscores PROC
    mov valuesfound,0
    mov cx, 250               ; Set the number of iterations
    mov si, offset read_buffer
    mov ax,'$'
    clearscoreloop:
        mov [si],ax
        inc si
    loop clearscoreloop
    ret
clearscores ENDP

isbart:
    mov si, offset bart
    mov avatarinitialx,15
    mov avatarfinalx,87
    mov avatarinitialy,90
    mov avatarfinaly,154
    jmp avatarprintdone

ismarge:
    mov si, offset marge
    mov avatarinitialx,20
    mov avatarfinalx,76
    mov avatarinitialy,90
    mov avatarfinaly,159
    jmp avatarprintdone

isbart1:
    mov si, offset bart
    mov avatarinitialx,15
    mov avatarfinalx,87
    mov avatarinitialy,90
    mov avatarfinaly,154
    jmp avatarprintdone1

ismarge1:
    mov si, offset marge
    mov avatarinitialx,20
    mov avatarfinalx,76
    mov avatarinitialy,90
    mov avatarfinaly,159
    jmp avatarprintdone1

Mainmenu PROC

    mov si, offset levelpt1    ;draw 
    mov yi, 110
    mov yf, 130
    mov xi, 90
    mov xf, 138
    call draw

    mov si, offset levelpt2    ;draw 
    mov yi, 110
    mov yf, 130
    mov xi, 138
    mov xf, 165
    call draw

    mov si, offset levelpt3    ;draw 
    mov yi, 110
    mov yf, 130
    mov xi, 165
    mov xf, 187
    call draw

    mov si, offset levelpt4    ;draw 
    mov yi, 110
    mov yf, 130
    mov xi, 187
    mov xf, 225
    call draw

    mov si, offset levelpt5    ;draw 
    mov yi, 110
    mov yf, 130
    mov xi, 225
    mov xf, 239
    call draw

    mov si, offset levelpt1    ;draw 
    mov yi, 140
    mov yf, 160
    mov xi, 86
    mov xf, 134
    call draw

    mov si, offset levelpt2    ;draw 
    mov yi, 140
    mov yf, 160
    mov xi, 134
    mov xf, 161
    call draw

    mov si, offset levelpt3    ;draw 
    mov yi, 140
    mov yf, 160
    mov xi, 161
    mov xf, 183
    call draw

    mov si, offset levelpt4    ;draw 
    mov yi, 140
    mov yf, 160
    mov xi, 183
    mov xf, 221
    call draw

    mov si, offset levelpt6    ;draw 
    mov yi, 140
    mov yf, 160
    mov xi, 221
    mov xf, 243
    call draw
    
    mov si, offset homer ;draw 
    mov yi, 130
    mov yf, 194
    mov xi, 280
    mov xf, 320 
    call draw

Mainmenu ENDP
    
Gamelogo proc
    
    mov si, offset H    ;draw 
    mov yi, 30
    mov yf, 80
    mov xi, 70
    mov xf, 108 
    call draw

    mov si, offset O    ;draw 
    mov yi, 30
    mov yf, 81
    mov xi, 110
    mov xf, 144 
    call draw

    mov si, offset M1   ;draw 
    mov yi, 29
    mov yf, 81
    mov xi, 146
    mov xf, 183
    call draw

    mov si, offset M2   ;draw 
    mov yi, 29
    mov yf, 81
    mov xi, 183
    mov xf, 197
    call draw

    mov si, offset E   ;draw 
    mov yi, 29
    mov yf, 81
    mov xi, 199
    mov xf, 231
    call draw

    mov si, offset R   ;draw 
    mov yi, 29
    mov yf, 82
    mov xi, 233
    mov xf, 267
    call draw

    mov si, offset arr6	
    mov yi, 47
    mov yf, 63
    mov xi, 90
    mov xf, 109 
    call draw

    mov si, offset arr7	;draw 
    mov yi, 47
    mov yf, 63
    mov xi, 111
    mov xf, 134 
    call draw


    mov si, offset arr8	;draw 
    mov yi, 47
    mov yf, 63
    mov xi, 136
    mov xf, 176
    call draw
					

    mov si, offset arr9	;draw 
    mov yi, 47
    mov yf, 63
    mov xi, 178
    mov xf, 201
    call draw

    mov si, offset arr10	;draw 
    mov yi, 47
    mov yf, 63
    mov xi, 203
    mov xf, 246 
    call draw

    ret
Gamelogo endp
                    
draw proc
    mov ah,0ch
    mov dx, yi        ; y coordinate initial( up down)
y:
    mov cx, xi        ; x coordinate initial (left right)
x:
    mov al,[si]            ; start array
    int 10h
    inc si                ; increment full row  (x axis)
    inc cx
    cmp cx, xf        ; x coordinate final( left right)
    jb x
    inc dx                ; jump to next row
    cmp dx, yf        ; y coordinate final( up down)
    jb y
ret
draw endp

exit:
mov ah, 4ch
int 21h
end
