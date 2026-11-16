# Macros do caçador

> **Atenção:** os macros deste guia e do [Patch 0.1](../patches/PATCH-0.1.md) são para a classe **Hunter / Caçador**. As demais classes precisam personalizar seus próprios macros. Não copie nomes de habilidades de Hunter para outra classe.

Os nove textos abaixo foram extraídos da configuração usada no perfil original. Crie-os em `/macro`, mantendo os nomes para que as legendas opcionais reconheçam os quatro ataques de RT. Use o ícone de interrogação e coloque cada macro na barra pelo editor nativo do controle.

**Copie um bloco por macro.** Os nomes das habilidades são do cliente ptBR. Se o seu grimório usar outro nome ou idioma, adapte o texto pelo grimório; as legendas fixas só reconhecem os nomes ptBR documentados.

## Antes de usar

Uma pressão faz o jogo **tentar** as linhas daquele macro. Ela não faz várias magias com tempo de recarga global serem lançadas simultaneamente, não espera uma recarga terminar e não escolhe uma rotação por você. Alcance, mana, alvo, recarga, habilidades aprendidas e estado do pet continuam valendo.

O prefixo `!` em uma habilidade alternável evita que pressões repetidas a desliguem. Aqui ele é usado no Tiro Automático e na preparação do Golpe do Raptor. Isso não faz o personagem conseguir atirar em qualquer alcance ou disparar enquanto as regras do jogo não permitem.

As condições `[harm,nodead]` exigem um alvo hostil vivo. Confirme seu alvo antes do primeiro toque.

## LT + X — HX Abrir

```text
#showtooltip Marca do Caçador
/petautocaston Investida
/petautocaston Rosnar
/petattack [harm,nodead]
/cast [harm,nodead] !Tiro Automático
/castsequence [harm,nodead] reset=target/combat Marca do Caçador,Tiro de Concussão,null
```

**Primeiro toque:** habilita o autocast de Investida e Rosnar, envia o pet, solicita Tiro Automático e tenta lançar Marca do Caçador. **Outro toque**, quando o jogo permitir, avança a sequência para Tiro de Concussão. O `null` encerra essa sequência até ela ser reiniciada pela troca de alvo ou pela saída de combate.

Se uma etapa não puder ser lançada, a sequência não avança como se ela tivesse sido concluída. Você ainda precisa apertar novamente; não há disparo programado para depois.

Este texto considera o **javali treinado com Investida e Rosnar** da configuração original. Habilitar autocast não é obrigar o pet a usar duas habilidades naquele instante: ele depende de distância, foco e recarga. Investida aplica o efeito descrito no grimório do pet; no teste original era uma breve imobilização, não um atordoamento universal.

### Variante para grupo com tanque

O texto principal **liga Rosnar novamente a cada uso**. Em um grupo com tanque, prefira uma cópia sem essas duas linhas de autocast e confira manualmente o Rosnar desligado na barra do pet:

```text
#showtooltip Marca do Caçador
/petattack [harm,nodead]
/cast [harm,nodead] !Tiro Automático
/castsequence [harm,nodead] reset=target/combat Marca do Caçador,Tiro de Concussão,null
```

Retirar a linha que liga o autocast não o desliga sozinho; ajuste o Rosnar antes de começar a masmorra.

## RT + X — HX Lento

```text
#showtooltip Tiro de Concussão
/petattack [harm,nodead]
/cast [harm,nodead] Investida
/cast [harm,nodead] Tiro de Concussão
/cast [harm,nodead] Cortar Asas
/cast [harm,nodead] !Tiro Automático
```

**Atualizado no Patch 0.1.** Envia o pet e tenta sua Investida, seguida de Tiro de Concussão e Cortar Asas. O jogo aplica as condições de cada habilidade: Concussão atende ao ataque à distância; Cortar Asas é a tentativa de lentidão corpo a corpo. O pedido de tiro automático permanece.

Esse botão não contém Marca do Caçador. Você pode usá-lo para pedir a Investida sem reaplicar a marca pelo LT + X. As habilidades do caçador continuam tendo seus custos normais; a Investida depende do foco e da recarga do pet.

Na configuração conferida, a Investida do javali exige distância entre 8 e 25 do pet até o inimigo, nas unidades de alcance do cliente. Se o javali já estiver encostado no alvo, ela não sai. Outros ajudantes podem não conhecer essa habilidade. Não há uma tentativa agendada para quando o alcance ou a recarga permitirem: é necessário um novo comando seu.

O ícone principal continua sendo Tiro de Concussão. Repetir o macro não elimina recargas nem permite executar várias habilidades com recarga global ao mesmo tempo. [Texto pronto para copiar](../macros/HX-Lento.txt).

## RT + Y — HX Picada

```text
#showtooltip Picada de Serpente
/petattack [harm,nodead]
/cast [harm,nodead] Picada de Serpente
/cast [harm,nodead] !Tiro Automático
```

Aplica dano ao longo do tempo enquanto mantém o pedido de ataque do pet e de tiro automático. Acompanhe o efeito no alvo: reaplicá-lo antes da hora pode gastar mana sem necessidade.

## RT + B — HX Arcano

```text
#showtooltip Tiro Arcano
/petattack [harm,nodead]
/cast [harm,nodead] Tiro Arcano
/cast [harm,nodead] !Golpe do Raptor
/startattack [harm,nodead]
/cast [harm,nodead] !Tiro Automático
```

O botão tenta Tiro Arcano e também a preparação do Golpe do Raptor. De longe, o disparo é a ação principal. Perto, o Raptor pode ser preparado para a próxima pancada corpo a corpo, conforme o comportamento das habilidades no cliente. `/startattack` solicita o ataque básico.

Esse macro **não contém uma condição que mede distância e escolhe automaticamente uma magia**. Ele tenta as linhas e o jogo aplica suas regras. O comportamento de longe e perto foi confirmado pelo jogador na configuração original.

O ícone principal permanece **Tiro Arcano**. A alternância visual baseada em recarga foi retirada do projeto. O ícone de Arcano não informa individualmente a recarga de Raptor.

## RT + A — HX Corpo

```text
#showtooltip Golpe do Raptor
/petattack [harm,nodead]
/cast [harm,nodead] Cortar Asas
/startattack [harm,nodead]
/cast [harm,nodead] !Golpe do Raptor
/cast [harm,nodead] !Tiro Automático
```

**Atualizado no Patch 0.1.** Tenta **Cortar Asas antes do Golpe do Raptor**, para aplicar lentidão quando o inimigo encosta. Solicita ataque básico, mantém o pet atacando e pede Tiro Automático sem desligá-lo por repetição. O disparo só acontece quando as condições normais do jogo permitem.

A ordem das linhas indica a ordem das tentativas; ela não agenda uma sequência automática nem ignora a recarga global. As habilidades só saem quando as regras do cliente permitem e podem exigir outra pressão. O ícone principal permanece **Golpe do Raptor**, mesmo com Cortar Asas incluído antes dele. [Texto pronto para copiar](../macros/HX-Corpo.txt).

Raptor é uma resposta quando o inimigo encosta, não um recurso passivo sempre preparado sem apertar. O macro não se executa sozinho ao detectar um inimigo próximo.

## LT + → — HX Recuar

```text
#showtooltip
/stopattack
/petpassive
/petfollow
```

Interrompe seu ataque automático, coloca o pet em passivo e pede que ele volte a seguir. Isso não apaga dano periódico já aplicado nem garante a saída imediata de combate. Confira se você não apertou outro macro de ataque depois, pois ele pode enviar o pet de novo.

## RT + ↑ — HX Chamar

```text
#showtooltip [@pet,dead] Reviver Ajudante; Chamar Ajudante
/cast [nopet] Chamar Ajudante
/cast [@pet,dead][nopet] Reviver Ajudante
```

| Estado do ajudante | Tentativa do macro |
|---|---|
| Vivo e presente | Não chama nem dispensa. |
| Ausente | Tenta Chamar Ajudante e tem uma tentativa de Reviver como fallback. |
| Morto e reconhecido como unidade de pet | Tenta Reviver Ajudante. |

Quando um pet vivo ausente é chamado, o fallback de Reviver pode produzir uma mensagem nativa de recarga/condição no mesmo toque, antes de o cliente atualizar a unidade de pet. Isso foi observado no teste original; o pet foi chamado corretamente.

Reviver exige habilidade aprendida, recursos e tempo de lançamento. O teste com pet morto não foi realizado; não se presume que um único toque resolva todo estado de cadáver dispensado em qualquer cliente. Esse macro não inclui Curar Ajudante nem Dispensar Ajudante.

## Macros auxiliares sem posição obrigatória

### HX Marca

```text
#showtooltip Marca do Caçador
/cast [harm,nodead] Marca do Caçador
```

Marca o alvo sem enviar o pet. Útil para preparar a luta com mais controle.

### HX Pet

```text
#showtooltip
/petattack [harm,nodead]
```

Envia somente o pet ao alvo hostil vivo. Você escolhe a posição na barra conforme sua preferência.

## Legendas e ícones

`/cmf ligar` mostra descrições visuais fixas das ações secundárias reconhecidas em `HX Lento`, `HX Picada`, `HX Arcano` e `HX Corpo`. O addon compara o nome e as linhas do macro para evitar uma legenda incorreta. Mudanças mais complexas podem fazer a legenda sumir.

`/cmf desligar` volta ao visual sem mini-ícones; essa é a preferência inicial da distribuição. As letras do controle continuam visíveis. As legendas não alteram o macro, não mostram o melhor botão para apertar e não indicam a disponibilidade de cada magia secundária.

## Exemplo de uma luta simples

Selecione um inimigo adequado ao seu nível. Use **LT + X**, deixe o pet se aproximar e confirme o alvo. Aplique **RT + Y** se fizer sentido manter dano contínuo. Use **RT + B** quando puder atacar à distância. Se precisar ganhar espaço, use **RT + X**; se o inimigo encostar, **RT + A** é sua resposta de perto. Reposicione-se e acompanhe sua vida, mana e a vida do ajudante.

Este exemplo é um exercício para aprender o controle. Não é uma promessa de rotação ótima para todo nível, talento, inimigo ou composição de grupo.
