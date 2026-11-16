# Jogando no controle

## Como ler as combinações

`RT + B` significa **segurar RT e então apertar B**. Solte o botão e o gatilho para voltar ao estado normal. Para LT + RT, segure os dois gatilhos e use o direcional ou um botão frontal conforme o símbolo mostrado no grupo central.

Neste guia, a referência é a disposição **Xbox**:

```text
                   Y
               X       B
                   A

LT: gatilho esquerdo       RT: gatilho direito
LB: botão de ombro         RB: botão de ombro
↑ ↓ ← →: direcional digital, não os analógicos
```

Alguns 8BitDo trazem letras em outra disposição física ou são apresentados ao computador como outro modelo. Siga o **símbolo e a posição que o jogo reconhece**. Se as letras não correspondem, corrija o perfil de entrada antes de memorizar os macros.

## Organização do perfil

| Combinação | Papel no perfil | O que lembrar |
|---|---|---|
| LT + X | Abrir combate | Pet primeiro; o macro marca o alvo e prepara o início da luta. |
| RT + X | Reduzir movimento | Investida do javali + tentativas de Concussão/Cortar Asas, sem reaplicar Marca. |
| RT + Y | Dano ao longo do tempo | Picada continua causando dano; evite reaplicar a cada toque sem necessidade. |
| RT + B | Ataque à distância com opção de Raptor no mesmo macro | O ícone principal permanece Tiro Arcano. |
| RT + A | Corpo a corpo | Tenta Cortar Asas antes de Raptor para ajudar a abrir distância. |
| LT + → | Recolher o pet | Passivo + seguir e interrupção do seu ataque. |
| RT + ↑ | Chamar/reviver | Não é o comando de dispensar o pet. |
| LB + LT | Acesso nativo aos comandos do ajudante | O retrato do pet indica o acesso; leia o painel que abrir. |
| RB + RT | Acesso nativo às habilidades do ajudante | Habilidades disponíveis variam conforme o pet e o treinamento. |

As combinações de pet abrem os painéis nativos; não substituem os macros de chamar, atacar e recolher. Os atalhos principais precisam ser atribuídos manualmente quando você instala o perfil.

## Movimentação e seleção

Use o analógico esquerdo para se deslocar e o direito para controlar a câmera conforme o perfil nativo configurado. Mire a câmera no inimigo e **confirme qual alvo o jogo está usando** antes de enviar o pet. Virar a câmera pode alterar a seleção suave da interface de controle; isso não garante que o alvo desejado esteja selecionado.

Nos menus, use os prompts da própria janela para confirmar, voltar e navegar. Os comandos de uma janela de bolsa podem ser diferentes dos comandos de combate. Mantenha teclado e mouse disponíveis para a primeira instalação, copiar macros e arrastar os painéis dos addons.

## Bluetooth e ordem de abertura

Na configuração original, a sequência que funcionou foi:

1. Ligar o 8BitDo e aguardar a conexão Bluetooth no Windows.
2. Abrir a Steam com o perfil de controle usado no teste.
3. Abrir a Battle.net **pela entrada de jogo não Steam configurada**.
4. Abrir o WoW Forever pela Battle.net acompanhada pela Steam.
5. Confirmar no jogo se os analógicos e botões respondem.

O atalho pessoal que automatiza essa abertura depende dos caminhos e da entrada Steam daquele computador; ele não faz parte deste pacote. Cada pessoa deve configurar sua própria entrada. Em um sistema onde a entrada nativa já funcione corretamente, mantenha a configuração que funciona em vez de adicionar outra camada de tradução.

Evite deixar duas ferramentas convertendo o mesmo controle ao mesmo tempo. Se uma pressão gera dois comandos, teste um único caminho de entrada. Se usar Steam Input, teste seu perfil de gamepad antes de acrescentar atalhos de teclado.

## Treino rápido antes de uma luta

1. **Sem inimigo:** segure RT e identifique X, Y, B e A olhando os símbolos.
2. **Sem inimigo:** abra e feche os dois painéis do pet, seguindo as legendas nativas.
3. **Alvo fácil:** use LT + X uma vez, veja o pet sair e confira a marca.
4. **Longe:** use RT + Y uma vez e RT + B conforme a habilidade estiver pronta.
5. **Inimigo perto:** use RT + A e reposicione-se para voltar a atirar.
6. **Encerrar:** LT + → recolhe o pet. Confira se o combate terminou antes de mexer nos menus.

Não é preciso apertar todas as combinações de uma vez. Familiarize-se com uma função por etapa. [A explicação detalhada de cada macro está aqui](MACROS.md).

## Quando você aprender novas habilidades

Mantenha papéis parecidos nos mesmos botões: X para controle de movimento, Y para dano contínuo, B para o ataque à distância e A para a resposta de perto. Essa é uma organização de memória, não uma rotação universal.

Atualize um macro por vez e teste. Habilidades novas podem ter recargas e tempos globais que impedem o uso conjunto em uma única pressão. As legendas secundárias atuais só reconhecem os quatro textos documentados; uma edição diferente pode fazer a legenda daquele botão desaparecer, sem impedir o macro de funcionar.
