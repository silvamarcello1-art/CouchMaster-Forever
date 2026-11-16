# Patch 0.1 — Lentidão e imobilização nos botões de ataque

**CouchMaster Forever · 16 de novembro de 2026 · Hunter / Caçador**

Esta atualização reúne os ajustes feitos durante a progressão do personagem para facilitar o controle de movimento do inimigo, tanto à distância quanto quando ele encosta no caçador.

## O que mudou

| Botão | Macro | Adição |
|---|---|---|
| **RT + X** | **HX Lento** | **Cortar Asas** como tentativa de lentidão corpo a corpo, junto do Tiro de Concussão. |
| **RT + X** | **HX Lento** | **Investida do javali**, para pedir a breve imobilização do pet sem usar o botão de Marca do Caçador novamente. |
| **RT + A** | **HX Corpo** | **Cortar Asas antes do Golpe do Raptor**, para tentar desacelerar primeiro quando o inimigo se aproxima. |

> **ATENÇÃO — EXCLUSIVO PARA HUNTER:** as configurações de macros deste patch são para a classe **Hunter / Caçador**. Jogadores de outras classes precisam **personalizar seus próprios macros**, usando as habilidades da sua classe. O suporte visual atual do CouchMaster Forever continua específico para caçadores no layout `hihi`.

O ataque do pet e o pedido de Tiro Automático foram preservados nos dois macros. O RT + A mantém também o ataque básico. O **RT + B continua sendo Tiro Arcano** e não recebeu essas adições. O LT + X permanece como botão de abertura com Marca do Caçador.

## RT + X — HX Lento

```text
#showtooltip Tiro de Concussão
/petattack [harm,nodead]
/cast [harm,nodead] Investida
/cast [harm,nodead] Tiro de Concussão
/cast [harm,nodead] Cortar Asas
/cast [harm,nodead] !Tiro Automático
```

Use esse botão para enviar o pet e pedir a Investida junto das tentativas de lentidão. **Ele não contém Marca do Caçador**, então não reaplica a marca ao ser pressionado. Concussão e Cortar Asas continuam com seus custos normais; isso não torna o botão livre de gasto de mana.

A Investida é do **javali treinado** usado no perfil. Ela depende do foco e da recarga do pet e exige distância para investir. No cliente conferido, o alcance era de **8 a 25 entre o pet e o alvo**, nas unidades retornadas pelo jogo. Se o javali já estiver encostado no inimigo, a Investida não sai. Outro pet pode não ter essa habilidade.

[Abrir o texto para copiar](../macros/HX-Lento.txt)

## RT + A — HX Corpo

```text
#showtooltip Golpe do Raptor
/petattack [harm,nodead]
/cast [harm,nodead] Cortar Asas
/startattack [harm,nodead]
/cast [harm,nodead] !Golpe do Raptor
/cast [harm,nodead] !Tiro Automático
```

O macro tenta **Cortar Asas antes do Raptor** para ajudar a abrir distância quando o inimigo encostar. Ele continua solicitando o ataque do pet, o ataque básico e o Tiro Automático conforme as condições do jogo.

[Abrir o texto para copiar](../macros/HX-Corpo.txt)

## Como aplicar

1. **[Baixe o pacote completo do Patch 0.1](https://github.com/silvamarcello1-art/CouchMaster-Forever/raw/refs/heads/main/downloads/CouchMaster-Forever-Patch-0.1.zip).** Ele inclui o addon, o layout, a imagem de prévia e os guias atualizados.
2. Se já usa a UI, faça backup e, com o jogo fechado, substitua somente a pasta **`JoaoHunterUI`** dentro de `_forever_/Interface/AddOns/`. Não substitua sua pasta WTF. As alterações deste patch não exigem reimportar o layout que você já personalizou.
3. Entre com seu Hunter e confirme que **Cortar Asas** foi aprendida e que o javali conhece **Investida**.
4. Abra **`/macro`** e substitua o conteúdo de **HX Lento** e **HX Corpo** pelos textos acima, mantendo os nomes. A atualização do addon **não cria nem altera macros automaticamente**.
5. Confirme **HX Lento em RT + X** e **HX Corpo em RT + A** na sua barra de controle.
6. Faça `/reload` em um local seguro e teste os dois botões em um inimigo fácil.

Para uma instalação nova, comece pelo [guia de instalação](../docs/INSTALACAO.md). Para trocar posições, tamanhos ou ações, consulte [Personalização](../docs/PERSONALIZACAO.md).

## Ícones e funcionamento

- O ícone principal do **RT + X** continua sendo **Tiro de Concussão**.
- O ícone principal do **RT + A** continua sendo **Golpe do Raptor**.
- As legendas secundárias fixas foram atualizadas para reconhecer as novas linhas dos macros. O RT + X comporta até quatro mini-ícones secundários; os demais continuam com até três.
- Os mini-ícones continuam **desligados por padrão**. `/cmf ligar` e `/cmf desligar` controlam a preferência, sem alternância por recarga.
- O jogo tenta os comandos na ordem escrita. Alcance, recursos, recarga e recarga global continuam valendo; várias habilidades podem exigir outra pressão do botão. Não há execução posterior agendada.
- Cortar Asas e Concussão aplicam lentidão. A Investida deste javali oferece uma breve imobilização; esses efeitos não são equivalentes a um stun.

## O que foi verificado

Os dois macros foram salvos e seus textos conferidos na instalação de origem. Foram confirmados o vínculo de HX Lento em RT + X, Cortar Asas aprendida e a Investida na barra do javali. Os outros oito macros permaneceram iguais em cada alteração individual, incluindo o RT + B e a abertura em LT + X.

A sintaxe do addon e os testes isolados da UI foram conferidos para o pacote de distribuição. A confirmação do uso conjunto dessas adições em combate e a reprodução em outra conta continuam pendentes; este registro não declara testes que ainda não ocorreram.

As legendas foram sincronizadas sem alterar posições, tamanhos, símbolos do controle ou funcionamento nativo das ações. A versão interna do addon neste pacote é **2.1.6**; o número público desta atualização de experiência em jogo é **Patch 0.1**.

[Histórico de patches](README.md) · [Projeto e prévia](../README.md) · [Todos os macros](../docs/MACROS.md)
