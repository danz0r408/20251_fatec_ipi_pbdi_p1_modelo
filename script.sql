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
  RAISE NOTICE 'Número de alunos aprovados com pelo menos um pai PhD: ', v_contagem;

  CLOSE cur_contagem;
END;
$$;
-- ----------------------------------------------------------------
-- 3 Resultado em função dos estudos
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 4 Salário versus estudos
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 5. Limpeza de valores NULL
--escreva a sua solução aqui

-- ----------------------------------------------------------------