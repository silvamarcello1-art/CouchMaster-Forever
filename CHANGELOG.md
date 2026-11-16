# Histórico

## Patch 0.1 — 16/11/2026

- [Página completa do patch e instruções para aplicar](patches/PATCH-0.1.md).
- RT + X: adição de Investida do javali e Cortar Asas ao macro HX Lento, preservando Concussão, ataque do pet e Tiro Automático, sem reaplicar Marca do Caçador.
- RT + A: adição de Cortar Asas antes do Golpe do Raptor no macro HX Corpo.
- Legendas fixas opcionais sincronizadas com os dois macros; mini-ícones continuam desligados por padrão e não há alternância do ícone principal.
- Guia de macros e tabela de controles atualizados; textos individuais dos dois macros incluídos no pacote.
- **Atenção: os macros deste patch são exclusivos de Hunter. As demais classes precisam personalizar seus próprios macros.**
- Versão interna do addon: 2.1.6. Os patches de experiência em jogo usam a sequência 0.1, 0.2 e assim por diante.

## 2.1.5 — CouchMaster Forever, edição para compartilhar

- Nome público CouchMaster Forever; pasta e variável `JoaoHunterUI` preservadas por compatibilidade.
- Ajustes visuais ativos para qualquer caçador no layout `hihi`, removendo a dependência do nome do personagem original.
- Novo atalho `/cmf`, mantendo `/jhui`.
- Layout exportado pela interface nativa do jogo.
- Documentação de instalação, controle, macros, addons e recuperação.
- Guia de personalização: posições, tamanhos, organização de botões e limites dos ajustes fixos do addon.
- Mini-ícones fixos opcionais desligados por padrão em uma instalação nova.
- Ícone principal fixado pelo próprio `#showtooltip`, sem alternância por recarga.

## Base 2.1.4 — configuração pessoal

- Símbolos do controle persistentes nos grupos das habilidades.
- Retratos dos acessos do ajudante e combinações de ombro/gatilho abaixo da figura.
- Reposicionamento vertical do grupo central LT + RT.
- Legendas secundárias fixas reconhecidas para os quatro macros de ataque de RT.
- Registro local limitado aos 20 últimos eventos de bloqueio de addons, sem transmissão.

## Verificação desta distribuição

- Sintaxe Lua 5.1 dos arquivos próprios verificada com luaparse 0.3.1.
- Testes isolados de ativação para outro caçador, proteção de outros layouts/classes e preferência inicial das legendas.
- Nove macros conferidos com o arquivo de origem e dentro do limite de 255 caracteres, contando quebras de linha como LF.
- Layout extraído da exportação nativa, sem arquivo de conta completo.
- Conteúdo público verificado para excluir identificadores de conta, histórico de bloqueios, caminhos pessoais e configurações privadas.

A base visual foi observada em jogo e os principais macros anteriores de combate foram confirmados pelo jogador no perfil original. As adições do Patch 0.1 foram salvas e conferidas no cliente, mas seu comportamento conjunto em combate ainda precisa de confirmação do jogador. O ciclo chamar com pet ausente/vivo foi testado; reviver um pet morto não foi testado. A importação em outra conta e a distribuição completa continuam precisando de validação em outro cliente Forever.
