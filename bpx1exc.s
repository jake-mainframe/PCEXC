PCEXC    CSECT
* /bin/as -o bpx1exc.o bpx1exc.s 
* /bin/ld -S "//'SYS1.CSSLIB'" -o bpx1exc bpx1exc.o
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         ESAR  R2                      OBTAIN SECONDARY ASID
         ST    R2,SECOND
         L     R2,PCNUM                GET LX FROM PCNUM  
         WTO   'RUNNING PC ROUTINE'
***********************************************************************
*    SET UP BPX1EXC
***********************************************************************
         L     0,BPXNUM          
         LA    1,FULLARG  
         LA    7,PATHLEN
         ST    7,0(,1)         # store it's addr in first slot
         LA    7,PATH
         ST    7,4(,1)
         LA    7,FZERO
         ST    7,8(,1)
         ST    7,12(,1)  
         ST    7,16(,1)                
         ST    7,20(,1)
         ST    7,24(,1)
         ST    7,28(,1)
         ST    7,32(,1)
         XILF  7,X'80000000'
         ST    7,48(,1)         
***********************************************************************
*    RUN PC ROUT
***********************************************************************
         PC    0(R2)                   REQUEST SERVICE
         L     R2,SECOND               GET SAVED SECONDARY ASID
         SSAR  R2                      AND RESTORE IT
         WTO   'PC ROUTINE RAN'
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
PCNUM    DC    XL4'00001301'
SECOND   DS    XL4
BPXNUM   DC    XL4'00000038'
SAVE     DS    18F
PATHLEN  DC    F'7'            
PATH     DC    C'/bin/id'      
FZERO    DC    F'0'            
* shell vars
         DS    0F
FULLARG  DS    A
         DC    XL52'0'        # arg list here
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   PCEXC 
