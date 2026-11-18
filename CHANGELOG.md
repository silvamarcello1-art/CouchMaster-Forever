# Histórico

## 2.1.9

- Modos TV e notebook, com escolha salva e troca fora de combate.
- Nomes e barras compactos no notebook, com restauração dos tamanhos de TV.
- Quadros com vida e porcentagem; guia de rotas reposicionado mais acima.
- Pacote atualizado com addon, layout e instruções de instalação.

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

A base visual foi observada em jogo e os principais macros anteriores de combate foram confirmados pelo jogador no perfil original. O ciclo chamar com pet ausente/vivo foi testado; reviver um pet morto não foi testado. A importação em outra conta e a distribuição completa continuam precisando de validação em outro cliente Forever.
