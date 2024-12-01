call delay
delay:
    ldi r20, 0x10       
outerLoop:
    ldi r21, 0xff        

middleLoop:
    ldi r22, 0xff        

innerLoop:
    nop                  
    dec r22             
    brne innerLoop     

    dec r21              
    brne middleLoop    

    dec r20              
    brne outerLoop       

    ret                  
