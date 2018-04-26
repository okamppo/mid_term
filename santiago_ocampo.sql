--------------------------------------------------------
--  File created - Wednesday-April-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function FUNCTION_1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "EJERCICIOS"."FUNCTION_1" (a IN NUMBER,b IN NUMBER,c IN NUMBER)
    RETURN VARCHAR2 
    IS concatenated VARCHAR2(255);    
    BEGIN        
        IF(b >= c) THEN 
            concatenated := a||'/'||(a*b)||'/'||'andres'; 
        ELSE 
            concatenated := a||'/'||(a*b)||'/'||'martinez';
        END IF; 
    RETURN(concatenated);
    END;
--------------------------------------------------------
--  DDL for Function FUNCTION_2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "EJERCICIOS"."FUNCTION_2" (a IN VARCHAR,b IN VARCHAR,c IN VARCHAR)
    RETURN VARCHAR2 
    IS concatenated VARCHAR2(255);    
    BEGIN
        DECLARE
            --Part 1 variables
            part1 VARCHAR2(255);
            n NUMBER;
            m NUMBER;
            rev NUMBER:=0;
            r NUMBER;

            --Part 2 variables
            part2 VARCHAR2(255);
            v_length number;
            v_flag number := 0;
            v_out varchar2(255);

            --Part 3 variables
            part3 number;            

            --Part 4 variables
            part4 number;
            full_text varchar2(255);

        BEGIN
            --Check Palindrome
            n:=TO_NUMBER(a);
            m:=n;

            while n>0
            loop
                r:=mod(n,10);
                rev:=(rev*10)+r;
                n:=trunc(n/10);
            end loop;

            if m=rev
            then
                part1:='true';
            else
                part1:='false';
            end if;

            --Alternate case
            v_length := length(b);
            for i in 1..v_length Loop
                if v_flag = 0 then
                    v_out := v_out|| LOWER(substr(b,i,1));
                    v_flag := 1;
                else
                    v_out := v_out|| UPPER(substr(b,i,1));
                    v_flag := 0;
                end if;            
            End loop;
            part2 := v_out;

            --Vowels number
            SELECT length(c)- length(REGEXP_REPLACE(c,'[a,e,i,o,u,A,E,I,O,U]','')) 
            into part3 FROM DUAL;

            --Parameters lenght
            full_text := a||b||c;
            SELECT length(full_text) 
            into part4 FROM DUAL;

        concatenated := part1||'/'||part2||'/'||part3||'/'||part4;
        END;    
    RETURN(concatenated);
    END;
