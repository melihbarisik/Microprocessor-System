; Mikroislemcili Sistemler ve Laboratuvari Odev 2
; Melih Ensar Barisik B181210393

 		ORG 00h
		SJMP Basla
		ORG 30h
		
		

                
Basla:	MOV P2,#00h ;Bu kisimda Portlar ve Registerlara degerler veriliyor.
	    MOV P3,#0FFh
		MOV R0,#0FFh
		MOV R1,#0FFh
		MOV P1,#0FFH
BASILI: JB P1.0,BASILI  ;P1 butonu 0 olana yani basma isi birakana kadar çalistiran kisim

		
Ilerle: 	
		
		MOV P3,#11111111B //Calistirma icin degerler hazirlandi
		MOV P2,#00000000B
		 
		 
		ACALL BekletmeBir //Iki adet fonksiyon çagirilacak
		ACALL Bekletme
		
		
		SJMP BASILI
Bekletme:MOV R3,#38h
Sira:    MOV R4,#20h

Timer:	MOV TMOD,#00H  
		MOV TH0,#0F8H
		MOV TL0,#0CCH 
		SETB TR0
Dongu: 	JNB TF0,Dongu // Bayrak sifir olana kadar dongu çalistiriliyor.
		CLR TR0 
		CLR TF0 
		DJNZ R4,Timer
		DJNZ R3,Sira
		RET
BekletmeBir:	

		MOV R3,#10h
Sira2:	MOV R4,#1h
Timer2:	
	    ACALL Calistir
		MOV TMOD,#00H
		MOV TH0,#0F8H
		MOV TL0,#0CCH 
		SETB TR0
Dongu2: JNB TF0,Dongu2 
		CLR TR0 
		CLR TF0 
		DJNZ R4,Timer2 ;R4 bir azaltilip sifir degil ise Timer2 ye dallan
		DJNZ R3,Sira2  ;R3 bir azaltilip sifir degil ise Sira2 ye dallan
	         RET 				
Calistir:
		MOV P3,#11111110B ;4 segmentten ilki seçiliyor.
		MOV P2,#01010101B ;Ismimin bas harfi olan M yaziliyor
		
		
Seg1:   DJNZ R0,Seg1   ;R3 bir azaltilip sifir degil ise Seg1 dallan
		DJNZ R1,Seg1   ;R1 bir azaltilip sifir degil ise Seg1 dallan
		MOV R0,#0FFh
		MOV R1,#11h
		MOV P3,#11111101B ;4 Segmentten ikincisi seciliyor
		MOV P2,#01111100B ;Soyismimin bas harfi olan B yaziliyor


Seg2:	DJNZ R0,Seg2 ;R0 bir azaltilip sifir degil ise Seg2 dallan
		DJNZ R1,Seg2 ;R1 bir azaltilip sifir degil ise Seg2 dallan
		MOV R0,#0FFh
		MOV R1,#11h
		MOV P3,#11111011B ;4 Segmentten ücüncüsü seciliyor
		MOV P2,#00000110B ;Ögretinimim olan 1 sayisi yazildi


Seg3:	DJNZ R0,Seg3 ;R0 bir azaltilip sifir degil ise Seg3 dallan
		DJNZ R1,Seg3 ;R1 bir azaltilip sifir degil ise Seg3 dallan
		MOV R0,#0FFh
		MOV R1,#11h
		MOV P3,#11110111B  ;4 Segmentten dördüncüsü seciliyor
		MOV P2,#01111100B ;Ders grubum olan B harfi yazildi
		
		
Seg4:	DJNZ R0,Seg4
		DJNZ R1,Seg4
		MOV R0,#0FFh
		MOV R1,#11h		
        MOV P3,#11111111B
		MOV P2,#11111111B 

		RET

		END 
 
