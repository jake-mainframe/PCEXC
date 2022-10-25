TESTBPX CSECT                                                          
* /bin/as -o testbpx.o testbpx.s                                       
* /bin/ld -S "//'SYS1.CSSLIB'" -o testbpx testbpx.o                    
* dbx testbpx                                                          
* stepi                                                                
* stepi 10                                                             
* registers                                                            
* listi 0x000000001f8b11e0                                             
* 0x1f8b11fc (???)       41f00fff     LA      R15,4095                 
* 0x1f8b1200 (???)       41ff0301     LA      R15,769(R15)             
* 0x1f8b1204 (???)       b218f02a     PC      42(R15)                  
***********************************************************************
*    INITIALIZATION                                                    
***********************************************************************
         BALR  R12,0                                                   
         USING *,R12                                                   
         STM   R14,R12,SAVE                                            
***********************************************************************
*    MAINSTREAM OF PROGRAM                                             
***********************************************************************
         CALL BPX1SUI                                                  
***********************************************************************
*    END OF PROGRAM                                                    
***********************************************************************
ENDPROG  LM    R14,R12,SAVE                                            
         XR    R15,R15                                                 
         BR    R14                                                     
***********************************************************************
*    DATA                                                              
***********************************************************************
SAVE     DS    18F                                                     
***********************************************************************
*    DATASETS                                                          
***********************************************************************
***********************************************************************
*    MACROS                                                            
***********************************************************************
         YREGS                                                         
         END   TESTBPX                         