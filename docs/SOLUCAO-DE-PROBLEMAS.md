# Problemas frequentes e manutenção

## O addon não aparece

Confira se existe `Interface/AddOns/JoaoHunterUI/JoaoHunterUI.toc`. Uma pasta duplicada é a causa mais simples de corrigir. Se a pasta foi criada com o jogo aberto, feche e reabra o cliente. Selecione a instalação **Forever**, não a pasta de outro cliente.

## Instalei, mas o visual não mudou

Use um personagem **caçador**, habilite a interface nativa de controle e selecione o layout **hihi**. O addon não muda outros nomes de layout. `/cmf` deve abrir o painel de opções mesmo quando os ajustes de layout não estão ativos.

O pacote não transporta as habilidades das barras. Crie os macros e atribua-os aos botões manualmente.

## LT ou RT não amplia o grupo

No Modo de edição, confira as opções nativas da barra de controle para **expandir** e **destacar** o grupo ativo. Salve o layout. Faça `/reload` em um local seguro e teste novamente. O aumento dos grupos vem do jogo; habilitar mini-ícones no `/cmf` não controla esse efeito.

## A barra pula ou se sobrepõe

Saia do Modo de edição antes de testar. Verifique se outro addon também move as barras nativas e teste temporariamente apenas o CouchMaster Forever com o layout importado. Em outro formato de tela, reposicione os quadros pelo editor nativo. Não tente corrigir arrastando painéis durante o combate.

O medidor de dano é um elemento separado. Mova-o para fora da área das ações no Modo de edição. Questie e RestedXP têm posicionamento próprio nas respectivas opções.

## Os mini-ícones não aparecem

Eles começam desligados: use `/cmf ligar`. Só existem para `HX Lento`, `HX Picada`, `HX Arcano` e `HX Corpo`, com os textos documentados. A validação rejeita combinações diferentes ou mais complexas para evitar exibir uma descrição incorreta.

Eles são pequenos ícones fixos das ações secundárias, sem recarga individual nem seleção dinâmica. Para ocultá-los, `/cmf desligar`.

## RT + B mostra Arcano mesmo no corpo a corpo

É o comportamento esperado de `#showtooltip Tiro Arcano`. O addon não alterna mais esse ícone. O macro ainda contém Golpe do Raptor; a imagem principal não resume a disponibilidade de todas as linhas. Consulte o grimório e as mensagens nativas para saber por que uma ação falhou.

## O pet não investe ou não usa Rosnar

Confira se seu pet conhece essas habilidades, se o autocast está ativo, se há recurso e recarga disponíveis e se ele alcança o inimigo. O macro habilita autocast; não força duas habilidades indisponíveis a acontecerem imediatamente.

O macro `HX Abrir` foi feito para o javali treinado usado no perfil original. Outro pet pode não ter Investida. Em um grupo com tanque, mantenha o Rosnar sob controle: o macro de abertura documentado volta a habilitá-lo. Veja a variante de grupo em [MACROS.md](MACROS.md).

## O pet morto não revive com o primeiro toque

O macro tenta chamar quando não existe uma unidade de pet e tenta reviver quando o pet está morto ou ausente. Se o cadáver estiver dispensado, o cliente pode precisar primeiro reconhecer a condição. Confira a mensagem de erro, mana e tempo de lançamento; repita somente depois de entender o estado do pet. O teste com pet morto não foi realizado na configuração de origem.

## Os botões aparecem, mas o controle não responde

Ter símbolos de controle visíveis não prova que o dispositivo está enviando comandos. Confirme a conexão Bluetooth, o reconhecimento no Windows e a sequência de abertura descrita em [CONTROLE.md](CONTROLE.md). Se a Battle.net já estava aberta fora da cadeia da Steam, feche-a normalmente e refaça a abertura. Não encerre o jogo durante uma luta para fazer esse teste.

Se os comandos estão duplicados, remova a sobreposição de tradutores e teste um único perfil. Não é necessário alterar autenticação, antivírus ou configurações de segurança.

## Erro ao fechar o mapa com controle

Na configuração original houve um conflito do MapUtils com a seleção nativa do controle ao fechar o mapa. A instalação local usa uma correção específica para MapUtils 1.7.6, documentada em [ADDONS.md](ADDONS.md). Essa correção não está incluída no download público da UI.

Teste a versão atual do MapUtils primeiro. Se ocorrer erro semelhante, desative só o MapUtils e confirme se o mapa nativo fecha normalmente. Evite ativar OpenMap e MapUtils juntos no primeiro teste.

## Como atualizar ou desfazer

Feche o jogo, faça uma cópia da versão atual e substitua apenas a pasta `JoaoHunterUI` pela nova. Não substitua suas pastas WTF nem os arquivos de outros addons.

Para desativar os ajustes, selecione outro layout e recarregue a interface, ou desmarque CouchMaster Forever na lista de addons e use `/reload`. O layout importado permanece salvo e pode ser trocado pelo seu layout anterior. Os macros criados manualmente também permanecem: remova-os pelo menu de macros somente se não os quiser mais.

## Como relatar um problema

Informe a versão do addon, versão do Forever, modelo do controle, conexão usada, proporção da tela e passos para reproduzir. Se houver uma mensagem de erro, copie apenas o trecho relevante. Em capturas públicas, oculte mensagens privadas e dados da sua conta. Não envie toda a pasta WTF.
