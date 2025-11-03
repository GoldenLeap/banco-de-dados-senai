/* Exercicio 1 */
SHOW TABLES; # Exibe as tabelas do banco de dados
/* Exercicio 2 */
DESCRIBE ducks; # Describe (tabela) exibe a tabela de uma forma mais detalhada
/* Exercicio 3 */
SELECT * FROM ducks; # Seleciona todas as colunas da tabela ducks
/* Exercicio 4 */
SELECT * FROM ducks WHERE age <= 3; # Seleciona todas as colunas que se encaixam na condição (age menor ou igual a 3 )
/* Exercicio 5 */
SELECT * FROM DUCKS ORDER BY age ASC; # Seleciona todas as colunas ordenando elas pela idade na ordem crescente
/* Exercicio 6 */
SELECT * FROM DUCKS ORDER BY age ASC LIMIT 3; # Limita as colunas para 3 
/* Exercicio 7 */
SELECT name, age * 12 FROM ducks; # Converte a idade para meses
/* Exercicio 8 */ 
SELECT DISTINCT species FROM ducks; # Seleciona todos os valores unicos das especies
/* Exercicio 9 */ 
SELECT * FROM duck_surveys USING SAMPLE 10 ROWS; # Seleciona 10 linhas aleatorias
/* Exercicio 10*/
SELECT COUNT(*), AVG(age), MIN(age), MAX(age) FROM ducks; # Mostra o total de patos, a media, o maximo e o minimo de idade