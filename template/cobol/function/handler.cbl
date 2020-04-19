       IDENTIFICATION DIVISION.
       PROGRAM-ID. HANDLER.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT standard-input ASSIGN TO KEYBOARD.
           
       DATA DIVISION.
       FILE SECTION.
       FD standard-input.
           01 stdin-record PIC X(25).

       WORKING-STORAGE SECTION.
       01 file-status PIC X VALUE SPACE.
          88 end-of-file    VALUE HIGH-VALUE
             WHEN SET TO FALSE IS LOW-VALUE.

       PROCEDURE DIVISION.
       OPEN INPUT standard-input.
       READ standard-input
            AT END SET end-of-file TO TRUE
       END-READ.
       
       IF stdin-record = SPACE or stdin-record = LOW-VALUE THEN
          DISPLAY "HELLO WORLD"
       ELSE
          DISPLAY "HELLO " stdin-record
       END-IF.
       STOP RUN.
