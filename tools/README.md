# Verificação para manutenção

O arquivo `test-addon.lua` prepara um ambiente mínimo para executar o addon inteiro e conferir a ativação em outro caçador, a restauração ao sair do layout e a preferência inicial das legendas.

Na preparação desta versão, a sintaxe foi analisada com **luaparse 0.3.1**, em modo Lua 5.1. O teste isolado rodou com **fengari-web 0.1.4**, carregando nesta ordem:

1. `tools/test-addon.lua`;
2. `JoaoHunterUI/JoaoHunterUI.lua`, sem alterar seu conteúdo;
3. `return RunCouchMasterTests()`.

O teste usa um substituto de `unpack` (`unpack = table.unpack`) porque o interpretador de teste usa Lua 5.3. O cliente-alvo mantém a função global do WoW.

Esses testes não reproduzem o sistema de quadros protegidos, entrada física do controle ou navegação do cliente. Para validar uma atualização no jogo, confira em local seguro o destaque de LT/RT, o grupo LT + RT, os dois painéis do pet e a troca de layout, observando mensagens de erro. Teste combate apenas depois dessa etapa.
