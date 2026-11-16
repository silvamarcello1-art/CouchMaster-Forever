# Addons que acompanham a ideia do perfil

**Cada pessoa instala os addons pelos links dos autores.** O pacote CouchMaster Forever distribui somente nosso addon e nosso layout. Assim você escolhe os recursos que precisa e recebe as atualizações nas fontes corretas.

As versões abaixo são as **observadas na configuração de origem em 16/11/2026**, não uma promessa de que continuem sendo as versões mais recentes. Selecione a variante **Forever** nos downloads e verifique as dependências indicadas pelo autor.

## Missões e caminhos: cada um tem um papel

| Addon e fonte | Papel | Como usar no perfil |
|---|---|---|
| [Questie](https://www.curseforge.com/wow/addons/questie) | Mostra missões, objetivos e marcadores. | Mantenha o rastreador à direita. Use as opções em `/questie`. |
| [RestedXP Guide](https://www.curseforge.com/wow/addons/restedxp-guide) — 4.11.36 | Oferece um roteiro de progressão por etapas. | Deixe o guia à esquerda e acompanhe a etapa escolhida; `/rxp` abre o acesso do addon. |
| [Shortest Path Forever](https://www.curseforge.com/wow/addons/shortest-path-forever) — 1.37.1 | Planeja o deslocamento até um destino. | Use para chegar ao ponto da missão, NPC ou entrada. As opções ficam em `/path`. |
| [MapUtils](https://www.curseforge.com/wow/addons/maputils) — 1.7.6 com ajuste local | Acrescenta informações ao mapa, incluindo entradas e mapas de masmorras. | Ajuda a encontrar a porta de entrada; veja a nota de compatibilidade abaixo. |

**Fluxo prático:** o RestedXP sugere o que fazer em seguida; o Questie ajuda a visualizar os objetivos; o Shortest Path calcula como chegar ao destino selecionado. Ele não se limita a ser uma extensão do Questie. O MapUtils acrescenta referências ao mapa.

Se duas flechas apontarem para destinos diferentes, confira qual objetivo está selecionado em cada addon. Mantenha as flechas que ajudam sua orientação, mas evite seguir dois objetivos incompatíveis. Uma rota desenhada no mapa não movimenta o personagem por você.

O download gratuito do RestedXP não significa acesso automático a todos os roteiros até o nível 60. A disponibilidade depende dos guias oferecidos pelo autor e do conteúdo que você possui. Este projeto não inclui nem desbloqueia guias pagos. [Fonte: página oficial do RestedXP](https://www.curseforge.com/wow/addons/restedxp-guide).

## Planejamento e aprendizado

| Addon | Versão observada | Abrir | Dica de uso |
|---|---|---|---|
| [Talents Forever](https://www.curseforge.com/wow/addons/talents-forever/files/9642781) | 0.38.27.20261115 | `/tf` | Planeje antes de gastar pontos. No perfil original, a aplicação automática foi deixada desligada. |
| [Dungeon Journal](https://www.curseforge.com/wow/addons/dungeonjournal/files/9650596), de ExehnTV | 2.0.9 | `/dj` | Antes de uma masmorra, veja nível, missões e recompensas. |
| [GearQuest Forever](https://www.curseforge.com/wow/addons/gearquest-forever/files/9638287) | 1.2.0 | `/gq` | Consulte equipamentos e suas fontes para a classe/especialização selecionada. |
| [Attune](https://www.curseforge.com/wow/addons/attune/files/9600741) | 16001-41 | `/attune` | Acompanhe cadeias e requisitos de acesso. O painel extra de próximos passos pode ficar oculto para não duplicar o Questie. |
| [What’s Training?](https://www.curseforge.com/wow/addons/whats-training/files/9621224) | 11.4.8 | `/wt` | Veja o que já pode aprender e planeje uma visita ao treinador. Mostrar uma habilidade não significa que ela já foi aprendida. |

Os cinco carregaram e suas janelas abriram e fecharam na configuração de origem sem novos bloqueios registrados nesse teste. O GearQuest carregou a base de caçador sob demanda. Isso não equivale a testar todas as telas e todas as combinações possíveis desses addons.

## Bolsas, grupos e imersão

| Addon e fonte | Versão observada | Uso no controle |
|---|---|---|
| [Baganator](https://www.curseforge.com/wow/addons/baganator) + [Syndicator](https://www.curseforge.com/wow/addons/syndicator) | 860 + 291 | Bolsa organizada e consulta do inventário registrado. Use os prompts da janela para navegar; configure categorias com mouse no primeiro uso. |
| [LFG Forever](https://www.curseforge.com/wow/addons/lfg-forever), de Artefius | 1.5.0 | `/lfg` abre a busca de grupos e seus filtros. Use os prompts disponíveis; mouse e teclado continuam úteis para texto e filtros. |
| [Spoken](https://www.curseforge.com/wow/addons/spoken) | 3.9.0 | Vozes para diálogos e outros conteúdos. `/sp options` abre as opções; `/sp skip` pula a fala. Instale os pacotes de áudio ptBR pelo caminho indicado pelo autor. |
| [Pawn](https://www.curseforge.com/wow/addons/pawn) | 2.14.3 | Ajuda na comparação de itens conforme a escala selecionada. Confira os atributos e a escala antes de tratar uma seta como decisão definitiva. |
| [Auctionator](https://www.curseforge.com/wow/addons/auctionator) | 346 | Apoio à casa de leilões quando você chegar a essa etapa. Configure e pesquise com atenção aos preços antes de confirmar compras. |

O Baganator e o Syndicator permitem **consultar informações registradas do banco** longe dele; isso não concede acesso para retirar ou depositar itens à distância. Visite o banco para atualizar os dados e movimentar seus itens. [Fontes: Baganator](https://www.curseforge.com/wow/addons/baganator), [Syndicator](https://www.curseforge.com/wow/addons/syndicator).

O Spoken precisa dos arquivos de voz do módulo e idioma desejados. Instalar só o código pode deixar a narração sem áudio. Não incluímos esses arquivos no pacote. [Fonte e instruções de idiomas: Spoken](https://www.curseforge.com/wow/addons/spoken).

## Nota sobre MapUtils e controle

Na instalação de origem, fechar o mapa com a interface de controle gerava um bloqueio envolvendo `SetPreferredGamepadInteractTarget()`. Foi aplicado um ajuste local específico para a versão 1.7.6:

- O mapa externo mantém o zoom nativo do Forever quando a interface de controle está ativa.
- As prévias de masmorras usam uma visualização independente.
- Entradas e passagens continuam habilitadas.
- O teste de abrir, ampliar e fechar a prévia de Cavernas Ígneas passou com teclado e mouse.
- O uso do analógico e do botão B nessa prévia ainda dependia de confirmação com o controle.

Esse ajuste é separado do CouchMaster Forever e **não está incluído na distribuição**. Atualizações do MapUtils podem modificar ou corrigir o problema de outra maneira. Comece pela versão do próprio autor e teste o mapa em local seguro. OpenMap ficou desativado na configuração de origem para evitar duas soluções alterando o mesmo mapa.

## Receita para uma tela organizada

1. Importe o layout e ajuste primeiro as barras nativas.
2. Coloque RestedXP à esquerda e Questie à direita, com largura suficiente para ler.
3. Confira a altura do medidor de dano, alvo e vida para não cobrir as ações.
4. Mantenha a janela de planejamento de talentos, GearQuest, Dungeon Journal e Attune fechada durante o deslocamento; abra quando precisar consultar.
5. Use um rastreador principal de missões. O painel extra do Attune pode ser fechado pelo X.
6. Deixe os mini-ícones secundários desligados no início: `/cmf desligar`.
7. Depois de ajustar as posições, salve e faça `/reload`.

Instale os opcionais aos poucos. Se um deles não responder bem ao controle, isso não significa que os demais painéis tenham navegação idêntica ou que o CouchMaster acrescente suporte de gamepad a eles. Ele cuida das barras nativas do caçador; a navegação das janelas é responsabilidade de cada addon.
