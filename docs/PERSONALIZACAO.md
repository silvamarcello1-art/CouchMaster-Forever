# Deixe a UI do seu jeito

O perfil é um ponto de partida. Você pode trocar as habilidades dos botões, reposicionar os quadros e ajustar o tamanho dos elementos que o editor nativo permite modificar. O addon não exige que você use uma rotação ou um conjunto fechado de habilidades.

## Onde fazer cada ajuste

| Quero mudar… | Onde ajustar | Observação |
|---|---|---|
| Posição dos quadros de vida, mana, alvo e medidor de dano | **Esc → Modo de edição** | Selecione o elemento, reposicione e salve o layout. |
| Tamanho de um elemento nativo | Opções do elemento no **Modo de edição**, quando disponíveis | Os controles disponíveis variam por elemento. A escala geral da interface também muda o tamanho de vários painéis juntos. |
| Aparência compacta das barras do controle | Opções da barra de controle no **Modo de edição** | O cliente oferece opções de layout compacto e de mostrar grupos vazios. Teste com LT, RT e LT + RT. |
| Destaque e aumento do grupo ao segurar um gatilho | Opções nativas de **destacar** e **expandir** na barra de controle | O addon não controla esse aumento. |
| Habilidade ou macro de uma posição | Editor nativo de ações do controle | Substitua a ação daquela posição e confira o símbolo exibido. |
| Conteúdo de um macro | Menu **`/macro`** | Trocar o código não atribui o macro a um botão automaticamente. |
| Posição, largura ou tamanho do texto do Questie e RestedXP | Opções de **cada addon** | Esses painéis não acompanham automaticamente o layout importado. |
| Mostrar ou ocultar mini-ícones secundários | **`/cmf`**, `/cmf ligar` ou `/cmf desligar` | A preferência fica salva. Em uma instalação nova, começa desligada. |
| Retratos decorativos do pet e ajuste interno do grupo LT + RT | Código do addon, nesta versão | Esses detalhes ainda não têm controles de tamanho e posição no painel `/cmf`. |

Não existe um ajuste de tamanho independente para cada botão no nosso painel. Use primeiro os controles nativos disponíveis para a barra ou a escala da interface, sem presumir que todos os elementos tenham o mesmo menu de opções.

## Antes de experimentar

1. Faça os ajustes fora de combate, em um lugar seguro.
2. Exporte o seu layout atual pelo menu de layouts do Modo de edição e guarde o texto. Se preferir uma cópia de segurança dentro do jogo, salve uma cópia com outro nome.
3. Mantenha o layout de uso chamado **hihi** se quiser os ajustes do CouchMaster ativos. Uma cópia com outro nome serve como backup, mas não ativa os ajustes do addon.
4. Mude uma coisa por vez e salve antes de testar o controle.

Evite substituir a pasta WTF inteira por arquivos de outra pessoa. Importar o texto do layout e criar seus próprios macros preserva as outras configurações da sua conta.

## Tamanho e espaço livre

Comece pelo tamanho que permite ler as letras do controle sem se aproximar da tela. Depois, posicione a barra principal perto da borda inferior, deixando espaço para o grupo expandir ao segurar LT ou RT.

Se a tela parecer cheia, reduza primeiro a quantidade de painéis abertos. Feche as janelas de planejamento e consulta que não estiver usando. Ajuste a largura do guia do RestedXP e do rastreador do Questie para que o texto continue legível. Diminuir tudo ao mesmo tempo pode deixar uma tela limpa, mas difícil de ler no sofá.

Se alterar a **escala geral da interface** nas opções do jogo, confira de novo os dois retratos do pet, as legendas do controle e o grupo central. O perfil original foi montado em tela 16:9; outra proporção ou escala pode exigir reposicionamento.

## Trocar as habilidades dos botões

Use o editor nativo de ações/vínculos do controle, selecione a posição e coloque a habilidade ou macro desejado. Os nomes e caminhos do menu podem variar conforme a tradução e a versão do cliente; siga os prompts exibidos pelo próprio jogo.

Trocar **o que um botão executa** é diferente de mudar **qual combinação de botões acessa aquela posição**. Faça o primeiro ajuste na barra de ações; para alterar a combinação física, confira as opções de vínculos do cliente e o perfil de entrada do controle. O CouchMaster não reprograma o 8BitDo nem altera a Steam.

Uma organização fácil de memorizar é manter papéis semelhantes:

- **RT + X:** controle de movimento, como lentidão.
- **RT + Y:** dano contínuo, como Picada.
- **RT + B:** ataque à distância.
- **RT + A:** resposta de perto.
- **LT + →:** recolher o ajudante.
- **RT + ↑:** chamar ou reviver o ajudante.

Você pode mudar essa organização. Nesse caso, os exemplos de atalhos do guia deixam de corresponder à sua barra: anote seu novo mapa de botões e confira cada macro antes de uma luta.

## Ícone principal e mini-ícones

Para mudar a imagem principal de um macro, ajuste o ícone escolhido no menu de macros ou sua linha `#showtooltip`. Com o ícone de interrogação selecionado, o cliente pode usar a habilidade indicada nessa linha. Isso é diferente de mostrar o estado de todas as ações secundárias.

Os mini-ícones opcionais do CouchMaster só descrevem os quatro macros documentados de RT. Se você mudar nomes, adicionar magias, usar outro idioma ou trocar os macros de posição, a legenda pode desaparecer ou não acompanhar sua nova organização. Desligue o recurso com `/cmf desligar` até revisar a correspondência. As ações continuam sendo executadas pelo macro nativo.

A versão atual não possui um editor universal de legendas nem alternância de ícones por recarga. Alterar a aparência não acrescenta condições de alcance ou automação ao macro.

## Detalhes fixos desta versão

O tamanho e as posições dos dois retratos decorativos do ajudante, a escala de suas combinações de botões e o deslocamento do grupo central são definidos no código. O editor nativo pode mover o conjunto principal, mas não funciona como um editor livre dessas partes internas; o addon reaplica seus próprios pontos.

Para quem já mantém addons, estes são os valores de referência em `JoaoHunterUI/JoaoHunterUI.lua`:

| Trecho | Valor original | Função |
|---|---|---|
| `art:SetSize(38, 38)` em `PetArtwork` | 38 × 38 | Tamanho dos retratos decorativos. |
| `prompt:SetScale(0.70)` em `NewPrompt` | 0,70 | Escala da legenda de dois botões abaixo do retrato. |
| `PetArtwork(..., "Left", -252, ...)` | −252 | Deslocamento horizontal do retrato esquerdo. |
| `PetArtwork(..., "Right", 136, ...)` | 136 | Deslocamento horizontal do retrato direito. |
| Ponto do retrato em `PetArtwork` | altura 7 | Altura relativa à âncora inferior. |
| Ponto de sua legenda em `PetArtwork` | altura −16 | Altura da combinação de botões. |
| `bar:SetPoint(..., 0, 22)` em `Configure` | altura 22 | Deslocamento do grupo central LT + RT. |

Esses valores usam coordenadas da interface, não uma medida física fixa em pixels do monitor. Ao alterar a escala da legenda, revise também os divisores `0.70` usados no seu posicionamento para manter o alinhamento. Ao mudar o tamanho dos retratos, revise o espaço livre para suas legendas e para os painéis nativos do pet.

Faça backup antes de editar o código, altere somente sua cópia e recarregue a interface em local seguro. Não altere os manipuladores nativos, tabelas de ações ou comandos protegidos para reposicionar uma decoração. Uma atualização do addon pode substituir suas edições manuais.

## Checklist depois de personalizar

- Você consegue ler X, Y, B e A com os grupos fechados e expandidos?
- LT, RT e LT + RT cabem na tela sem cobrir vida, alvo ou medidor de dano?
- As combinações LB + LT e RB + RT continuam abaixo dos acessos do pet?
- As habilidades e macros estão nas posições que você anotou?
- O pet ataca e recolhe somente quando você dá os comandos esperados?
- Questie, RestedXP e flechas apontam para objetivos que você reconhece?
- O layout foi salvo e continua chamado `hihi`?

Se algo não ficar bom, volte à cópia do layout ou importe novamente [o perfil original](../profiles/hihi-layout.txt). Para recuperar alterações no código, reinstale apenas a pasta do addon. Consulte também [a solução de problemas](SOLUCAO-DE-PROBLEMAS.md).
