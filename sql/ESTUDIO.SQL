-- CREARCION DE TABLA
CREATE TABLE datos (
    nombre   VARCHAR2(30),
    apellido VARCHAR2(30),
    edad     NUMBER(2)
);
-- INSERTANDO DATOS EN TABLA DATOS

INSERT INTO datos VALUES('JUAN','GONZALEZ',23);
INSERT INTO datos VALUES('MARTIN','LAUTARO',27);
INSERT INTO datos VALUES('PEDRO','RAMIREZ',29);

----------------------------------------------------
-- USANDO %TYPE
DECLARE
    varnombre datos.nombre%type;
    varedad datos.edad%type;
    
BEGIN
    SELECT NOMBRE 
    INTO VARNOMBRE 
    FROM DATOS
    WHERE EDAD=27;
    
    dbms_output.put_line(SUBSTR(VARNOMBRE,1,2));
    
END;

-----------------------------------------------------
-- OPERADOR IF

DECLARE
    SALES NUMBER:= 60000;
    BONUS NUMBER:= 0;
BEGIN
    IF SALES > 50000 THEN
    BONUS := 1500;
    ELSIF SALES > 35000 THEN
    BONUS:= 500;
    ELSIF SALES > 15000 THEN
    BONUS := 300;
    ELSE
    BONUS := 100;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE ('Sales = '|| sales || ', bonus ' || bonus || '.' );
    
END;

----------------------------------------------------
-- CLAUSULA CASE

DECLARE
    V1 CHAR(1);
BEGIN
    V1 := 'A';
    
    CASE V1
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('VERY GOOD');
        WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('GOOD');
        WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('FAIR');
        WHEN 'E' THEN DBMS_OUTPUT.PUT_LINE('POOR');
        ELSE DBMS_OUTPUT.PUT_LINE('NO SUCH A VALUE');
    END CASE;    
END;

----------------------------------------------------
-- CLAUSULA SEARCHED CASE

DECLARE
    BONUS NUMBER;
BEGIN
    BONUS:= 100;
    CASE
        WHEN BONUS >500 THEN DBMS_OUTPUT.PUT_LINE('EXECCLENT');
        WHEN BONUS <=500 AND BONUS > 250 THEN DBMS_OUTPUT.PUT_LINE('VERY GOOD');
        WHEN BONUS <=250 AND BONUS > 100 THEN DBMS_OUTPUT.PUT_LINE('GOOD');
        ELSE DBMS_OUTPUT.PUT_LINE('POOR!!');
    END CASE;
END;

------------------------------------------------------
-- BUCLE LOOP

DECLARE
    X NUMBER := 1;
BEGIN
    LOOP
        dbms_output.put_line(x);
        X := X + 1;
        -- OPCION DE SALIDA CON IF
        /*IF X = 11 THEN
            EXIT;
        END IF;*/
        -- SEGUNDA OPCION CON IF
        EXIT WHEN X=11;
    END LOOP;
END;

--------------------------------------------------------
-- BUCLE LOOP (ETIQUETADA)

DECLARE 
    S PLS_INTEGER := 0;
    I PLS_INTEGER := 0;
    J PLS_INTEGER := 0;
BEGIN
    <<PARENT>>
    LOOP
        -- PRINT PARENT
        I := I+1;
        J := J+100;
        DBMS_OUTPUT.PUT_LINE('PARENT: '|| I);
        <<CHILD>>
        LOOP    
            -- PRINT CHILD
            EXIT PARENT WHEN (I>3);
            DBMS_OUTPUT.PUT_LINE('CHILD: '|| J);
            J:=J+1;
            EXIT CHILD WHEN (J > 105);
        END LOOP CHILD;
    END LOOP PARENT;
    DBMS_OUTPUT.PUT_LINE('FINISH!!!');
END;

-------------------------------------------------------------
-- BUCLE FOR (DENTRO DEL BUCLE FOR NO SE DECLARAN VARIABLES POR FUERA, FOR LAS DECLARA POR SU CUENTA)

BEGIN
    FOR I IN 1..20 LOOP -- VALOR INICIAL 1 AL 20 (valores son del tipo PLS_INTEGER)
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;

-------------------------------------------------------------
-- BUCLE FOR (REVERSA)

BEGIN
    FOR I IN REVERSE 1..20 LOOP -- VA DEL 20 AL 1
        DBMS_OUTPUT.PUT_LINE(I);
        EXIT WHEN I=10;
    END LOOP;
END;

---------------------------------------------------------------
-- BUCLE WHILE

DECLARE 
X NUMBER:=0;

BEGIN
    WHILE X <10 LOOP
        DBMS_OUTPUT.PUT_LINE(X);
        X:= X+1;
        EXIT WHEN X=5;
    END LOOP;
END;

----------------------------------------------------------------
-- GOTO

DECLARE
  p  VARCHAR2(30);
  n  PLS_INTEGER :=5;
BEGIN
  FOR j in 2..ROUND(SQRT(n)) LOOP
    IF n MOD j = 0 THEN
      p := ' no es un n�mero primo';
      GOTO print_now;
    END IF;
  END LOOP;

  p := ' Es un numero primo';
 
  <<print_now>>
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(n) || p);
END;
