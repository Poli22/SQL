CREATE OR REPLACE TRIGGER INSERT_IMP
AFTER INSERT ON IMP
FOR EACH ROW
DECLARE
N NUMBER;
BEGIN
  SELECT COUNT(*) INTO N
  FROM SUMMARY
  WHERE JOB = :NEW.JOB;
  IF (N = 0) THEN
    INSERT INTO SUMMARY(JOB, NUM)
    VALUES(:NEW.JOB, 1);
  ELSE
    UPDATE SUMMARY
    SET NUM = NUM + 1
    WHERE JOB = :NEW.JOB;
  END IF;
END;

CREATE OR REPLACE TRIGGER UPDATE_IMP
AFTER UPDATE OF JOB ON IMP
FOR EACH ROW
DECLARE
N NUMBER;
num NUMBER;
BEGIN
  -- aggiornamento dati relativi al nuovo lavoro
  SELECT COUNT(*) INTO N
  FROM SUMMARY
  WHERE JOB = :NEW.JOB;
  IF (N = 0) THEN
    INSERT INTO SUMMARY(JOB, NUM)
    VALUES(:NEW.JOB, 1);
  ELSE
    UPDATE SUMMARY
    SET NUM = NUM + 1
    WHERE JOB = :NEW.JOB;
  END IF;

  -- aggiornamento dati relativi al vecchio lavoro
  SELECT NUM INTO num
  FROM SUMMARY
  WHERE JOB = :OLD.JOB;
  IF (num = 0) THEN
    DELETE FROM SUMMARY
    WHERE JOB = :OLD.JOB;
  ELSE
    UPDATE SUMMARY
    SET NUM = NUM - 1
    WHERE JOB = :OLD.JOB;
  END IF;
END;
