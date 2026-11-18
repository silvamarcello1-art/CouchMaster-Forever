# Verificação para manutenção

O arquivo `test-addon.lua` prepara um ambiente mínimo para executar o addon inteiro e conferir a ativação em outro caçador, a restauração ao sair do layout, a preferência inicial das legendas e o reconhecimento dos macros de exemplo.

Na preparação desta versão, a sintaxe foi analisada com **luaparse 0.3.1**, em modo Lua 5.1. O teste isolado rodou com **fengari-web 0.1.4**, carregando nesta ordem:

1. Uma tabela global de teste `CouchMasterTestMacros` com as chaves `HX Lento` e `HX Corpo`, usando como valores os textos de `macros/HX-Lento.txt` e `macros/HX-Corpo.txt`;
2. `tools/test-addon.lua`;
3. `JoaoHunterUI/JoaoHunterUI.lua`, sem alterar seu conteúdo;
4. `return RunCouchMasterTests()`.

O teste usa um substituto de `unpack` (`unpack = table.unpack`) porque o interpretador de teste usa Lua 5.3. O cliente-alvo mantém a função global do WoW.

Esses testes não reproduzem o sistema de quadros protegidos, entrada física do controle ou navegação do cliente. Para validar uma atualização no jogo, confira em local seguro o destaque de LT/RT, o grupo LT + RT, os dois painéis do pet e a troca de layout, observando mensagens de erro. Teste combate apenas depois dessa etapa.
