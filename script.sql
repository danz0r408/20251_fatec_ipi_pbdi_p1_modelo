-- ----------------------------------------------------------------
-- 1 Base de dados e criação de tabela
--escreva a sua solução aqui
CREATE TABLE estudantes(
    cod_estudantes SERIAL PRIMARY KEY,
    studentid VARCHAR(200),
    mother_edu INT,
    father_edu INT,
    grade INT,
    salary INT,
    prep_study INT
);
-- ----------------------------------------------------------------
-- 2 Resultado em função da formação dos pais
--escreva a sua solução aqui
DO $$
DECLARE
  cur_contagem REFCURSOR;
  v_contagem INT;
BEGIN
  OPEN cur_contagem FOR
    SELECT COUNT(*)
    FROM estudantes
    WHERE grade >= 5 AND (mother_edu = 6 OR father_edu = 6);

  FETCH cur_contagem INTO v_contagem;
  RAISE NOTICE 'Número de alunos aprovados com pelo menos um pai PhD:', v_contagem;

  CLOSE cur_contagem;
END;
$$;
-- ----------------------------------------------------------------
-- 3 Resultado em função dos estudos
--escreva a sua solução aqui
DO $$
DECLARE
  cur_dinamico REFCURSOR;
  v_contagem INT;
  v_estuda_sozinho INT := 1;
BEGIN
OPEN cur_dinamico FOR EXECUTE
format('SELECT COUNT(*) 
FROM estudantes
WHERE grade >= 5 AND prep_study = $1')
USING v_estuda_sozinho;
FETCH cur_dinamico INTO v_contagem;
IF v_contagem = 0 THEN
RAISE NOTICE '%', -1;
ELSE
RAISE NOTICE '%', v_contagem;
END IF;
CLOSE cur_dinamico;
END;
$$;
-- ----------------------------------------------------------------
-- 4 Salário versus estudos
--escreva a sua solução aqui
DO $$
DECLARE
  cur_salarios_prep REFCURSOR;
  v_contagem INT;
  v_salario_codigo INT := 5;
  v_prep_frequente INT := 2;
  v_nome_tabela VARCHAR(200) := 'estudantes';
BEGIN
  OPEN cur_salarios_prep FOR EXECUTE
  format
  ('SELECT COUNT(*) FROM %s WHERE salary = $1 AND prep_study = $2', v_nome_tabela)
  USING v_salario_codigo, v_prep_frequente;
  FETCH cur_salarios_prep INTO v_contagem;
  RAISE NOTICE 'Número de alunos que se preparam regularmente: %', v_contagem;

  CLOSE cur_salarios_prep;
END;
$$;
-- ----------------------------------------------------------------
-- 5. Limpeza de valores NULL
--escreva a sua solução aqui

-- ----------------------------------------------------------------