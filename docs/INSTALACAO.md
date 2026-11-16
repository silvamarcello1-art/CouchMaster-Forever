# Instalação e primeiro uso

## 1. Confira os requisitos

- WoW **Forever**, com suporte à interface de controle e Interface 16001.
- Personagem da classe **Caçador**. Os macros e os dois acessos do ajudante foram preparados para essa classe.
- Controle reconhecido pelo Windows e pelo jogo. O teste original usou um 8BitDo Ultimate 2 por Bluetooth, com Steam Input na cadeia de abertura.
- Cliente em **ptBR** para copiar os macros como estão. Em outro idioma, use os nomes das habilidades do seu grimório.

O pacote é instalado manualmente. Não é necessário executar instaladores, programas de otimização ou scripts.

## 2. Faça um backup

Feche o WoW antes de copiar ou substituir arquivos. Guarde uma cópia da sua pasta `WTF` e da pasta `Interface/AddOns/JoaoHunterUI`, se ela já existir. O backup fica com você; não envie sua pasta WTF para outras pessoas.

Se já tiver um layout que gosta, mantenha-o salvo com outro nome no Modo de edição. A importação deve criar **um layout novo**.

## 3. Copie somente a pasta do addon

Extraia o ZIP. A estrutura final deve ser:

```text
World of Warcraft/
└── _forever_/
    └── Interface/
        └── AddOns/
            └── JoaoHunterUI/
                ├── JoaoHunterUI.toc
                └── JoaoHunterUI.lua
```

Evite uma pasta duplicada, como `AddOns/JoaoHunterUI/JoaoHunterUI/`. Não copie a pasta inteira do repositório para dentro do addon.

Abra o jogo e ative **CouchMaster Forever** na lista de complementos. Se acabou de adicionar a pasta enquanto o jogo estava aberto, feche e reabra o jogo para que ele encontre o addon novo.

## 4. Importe o layout hihi

1. Abra [hihi-layout.txt](../profiles/hihi-layout.txt) e copie a linha inteira, sem modificar símbolos ou espaços.
2. Dentro do jogo, abra **Esc → Modo de edição**.
3. No menu de layouts, escolha **Importar**, cole o texto e crie um layout chamado **hihi**.
4. Selecione esse layout e salve.

O arquivo foi gerado pela função nativa de exportação do jogo. Ele descreve posições e opções dos elementos da interface, sem dados da sua conta. Não é um arquivo para substituir diretamente o cache da pasta WTF.

O nome `hihi` é o que ativa os ajustes do addon. Renomeá-lo para outro nome desativa esses ajustes. O layout foi montado em uma tela 16:9; monitores de outra proporção ou outra escala de interface podem exigir reposicionamento pelo Modo de edição.

## 5. Ative as opções visuais nativas

No Modo de edição, selecione a barra de ações do controle. Mantenha as opções de **mostrar símbolos dos botões**, **destacar o grupo ativo** e **expandir o grupo ativo** habilitadas. O nome exato pode variar conforme a tradução do cliente.

O destaque e o aumento ao segurar LT ou RT são efeitos nativos. O addon mantém as letras dos botões visíveis sobre as habilidades; ele não substitui o sistema de expansão.

## 6. Monte as barras

Abra `/macro`, crie os macros de [MACROS.md](MACROS.md) e coloque-os nos botões indicados usando o editor nativo de ações/vínculos do controle. Selecione o ícone de interrogação ao criar um macro para permitir que `#showtooltip` defina o ícone.

O layout não copia as habilidades, os macros, os itens ou as páginas de ação de outro jogador. Não substitua o seu arquivo `macros-cache.txt`: use os textos documentados e mantenha suas outras macros.

## 7. Ajuste os addons opcionais

Instale-os pelas fontes em [ADDONS.md](ADDONS.md), escolhendo a variante **Forever**. Posicione o RestedXP à esquerda e o rastreador do Questie à direita, deixando espaço para as barras de baixo. Use o Modo de edição para posicionar o medidor de dano sem cobrir as ações.

A imagem do README inclui esses painéis adicionais, mas o addon visual funciona sem eles.

## 8. Faça o primeiro teste em segurança

- Confira se o analógico move o personagem e se os símbolos do jogo correspondem ao controle.
- Segure LT, solte e repita com RT: os grupos devem destacar sem saltar de posição.
- Segure LT + RT: o grupo central deve continuar visível, sem cobrir os grupos laterais.
- Teste chamar o pet vivo e ausente. Com o pet vivo ao lado, o macro não deve dispensá-lo.
- Selecione um inimigo fácil e confirme **uma vez** LT + X. Observe o alvo antes de continuar.
- Teste RT + B de longe e RT + A quando o inimigo estiver perto.
- Use LT + → para recolher o ajudante e interromper seu ataque.
- Deixe `/cmf desligar` se quiser reproduzir a escolha atual do perfil, sem mini-ícones.

Conclua com `/reload` para salvar as preferências. Se aparecer erro, siga [a recuperação](SOLUCAO-DE-PROBLEMAS.md) antes de continuar uma luta.
