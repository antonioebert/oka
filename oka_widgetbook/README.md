# OKA Widgetbook — Guia de Implementação Detalhado

> Design System OKA · Flutter · Widgetbook 3.x

---

## O que é o Widgetbook?

O **Widgetbook** é uma ferramenta de desenvolvimento para Flutter que funciona como um **catálogo interativo de componentes** — parecido com o Storybook do React. Ele roda como um app Flutter separado do seu app principal, onde você pode visualizar e interagir com cada componente de forma isolada, alterando suas propriedades em tempo real.

---

## Estrutura de Arquivos Gerada

```
oka_widgetbook/
├── pubspec.yaml                          ← dependências
└── lib/
    ├── design_system/
    │   └── tokens/
    │       ├── oka_colors.dart           ← todas as cores (primitivos + semânticos)
    │       ├── oka_typography.dart       ← TextStyles com Montserrat
    │       ├── oka_spacing.dart          ← espaçamento e border radius
    │       └── oka_tokens.dart           ← barrel export
    ├── components/
    │   ├── button/oka_button.dart        ← OkaButton (4 tipos, 4 tamanhos, 2 estados)
    │   ├── input/oka_input.dart          ← OkaInput (texto/telefone, 4 estados)
    │   ├── alert/oka_alert.dart          ← OkaAlert (3 status, 4 variações)
    │   ├── tag/oka_tag.dart              ← OkaTag (6 status)
    │   ├── pill/oka_pill.dart            ← OkaPill (em linha / empilhado)
    │   └── list/oka_list_item.dart       ← OkaListItem (8 variações)
    └── widgetbook/
        ├── main.widgetbook.dart          ← entry point do catálogo
        └── use_cases/
            ├── tokens/
            │   ├── colors_use_case.dart
            │   ├── typography_use_case.dart
            │   └── spacing_use_case.dart
            └── components/
                ├── button_use_case.dart
                └── components_use_case.dart
```

---

## Passo a Passo: Como Implementar

### Passo 1 — Criar o Projeto Flutter

No terminal, dentro da pasta do seu projeto:

```bash
# Opção A: Widgetbook como projeto separado (recomendado)
flutter create oka_widgetbook --platforms web,macos

# Opção B: Adicionar numa pasta dentro do monorepo existente
cd meu_app
mkdir widgetbook && cd widgetbook
flutter create . --platforms web,macos
```

> **Por que projeto separado?** O Widgetbook roda como um app Flutter independente. Separar evita poluir o `main.dart` do app de produção.

---

### Passo 2 — Adicionar as Dependências

Abra o `pubspec.yaml` e adicione:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1          # fonte Montserrat

dev_dependencies:
  widgetbook: ^3.8.0            # app do catálogo
  widgetbook_annotation: ^3.2.0 # anotações @UseCase
  build_runner: ^2.4.9          # gerador de código
  widgetbook_generator: ^3.8.0  # gera o catálogo automaticamente
```

Execute:

```bash
flutter pub get
```

---

### Passo 3 — Copiar os Arquivos de Token

Copie as pastas geradas para dentro do projeto:

```
lib/design_system/tokens/oka_colors.dart
lib/design_system/tokens/oka_typography.dart
lib/design_system/tokens/oka_spacing.dart
lib/design_system/tokens/oka_tokens.dart
```

Esses arquivos **não dependem de nada externo** além do `google_fonts`. Eles podem (e devem) ser compartilhados com o app principal via `package` ou via path dependency no pubspec.

---

### Passo 4 — Copiar os Componentes

Copie as pastas:

```
lib/components/button/oka_button.dart
lib/components/input/oka_input.dart
lib/components/alert/oka_alert.dart
lib/components/tag/oka_tag.dart
lib/components/pill/oka_pill.dart
lib/components/list/oka_list_item.dart
```

---

### Passo 5 — Copiar os Use Cases

```
lib/widgetbook/use_cases/tokens/colors_use_case.dart
lib/widgetbook/use_cases/tokens/typography_use_case.dart
lib/widgetbook/use_cases/tokens/spacing_use_case.dart
lib/widgetbook/use_cases/components/button_use_case.dart
lib/widgetbook/use_cases/components/components_use_case.dart
```

---

### Passo 6 — Configurar o Entry Point

Copie `lib/widgetbook/main.widgetbook.dart` para o projeto.

Depois, crie (ou edite) `lib/main.dart` para apontar para o widgetbook:

```dart
// lib/main.dart
export 'widgetbook/main.widgetbook.dart';
```

Ou rode diretamente:

```bash
flutter run -t lib/widgetbook/main.widgetbook.dart -d chrome
```

> **Dica:** Use `-d chrome` para rodar na web (mais rápido para iteração). Use `-d macos` para desktop.

---

### Passo 7 — (Opcional) Geração Automática de Código

Se quiser usar as anotações `@UseCase` com geração automática:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Isso gera um arquivo `main.widgetbook.g.dart` com o catálogo completo. Nesse caso, substitua `main.widgetbook.dart` por:

```dart
import 'main.widgetbook.g.dart';
void main() => runApp(const HotReload());
```

> **Atenção:** A geração automática detecta os arquivos com `@UseCase` e monta a árvore de diretórios pelo campo `path`. Se usar o arquivo manual (`main.widgetbook.dart`), não precisa rodar o build_runner.

---

## Como Funciona o Widgetbook

### Catálogo (Directories)

O catálogo é organizado em 3 níveis:

```
WidgetbookCategory      → "Tokens" / "Componentes"
  └── WidgetbookComponent → "Botão" / "Cores"
        └── WidgetbookUseCase → "Primário" / "Secundário"
```

No sidebar esquerdo do Widgetbook você navega por essa árvore.

### Knobs (Controles Interativos)

Os **knobs** são os controles que aparecem no painel direito do Widgetbook. Cada `context.knobs.xxx()` cria um controle diferente:

| Método | Controle gerado | Uso |
|--------|----------------|-----|
| `context.knobs.string()` | Campo de texto | Labels, mensagens |
| `context.knobs.boolean()` | Toggle on/off | isDisabled, isLoading |
| `context.knobs.list()` | Dropdown | Enums (tipo, tamanho, estado) |
| `context.knobs.int.slider()` | Slider numérico | Tamanhos, quantidades |
| `context.knobs.color()` | Color picker | Cores customizadas |

Exemplo do botão:
```dart
final tipo = context.knobs.list<OkaButtonType>(
  label: 'Tipo',
  options: OkaButtonType.values,
  labelBuilder: (v) => v.name,
  initialOption: OkaButtonType.primario,
);
```

### Addons

Os addons adicionam funcionalidades globais ao Widgetbook:

| Addon | O que faz |
|-------|----------|
| `DeviceFrameAddon` | Renderiza o componente dentro de um frame de device real |
| `ThemeAddon` | Alterna temas (light/dark) |
| `TextScaleAddon` | Testa acessibilidade com zoom de texto |
| `AlignmentAddon` | Move o componente na tela |
| `GridAddon` | Mostra grid de referência |

---

## Como Adicionar um Novo Componente

### 1. Crie o componente

```dart
// lib/components/meu_componente/oka_meu_componente.dart
class OkaMeuComponente extends StatelessWidget {
  const OkaMeuComponente({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Text(label);
}
```

### 2. Crie o use case

```dart
// lib/widgetbook/use_cases/components/meu_componente_use_case.dart
import 'package:widgetbook/widgetbook.dart';
import '../../../components/meu_componente/oka_meu_componente.dart';

Widget meuComponenteUseCase(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Texto');
  return Center(child: OkaMeuComponente(label: label));
}
```

### 3. Registre no catálogo (main.widgetbook.dart)

```dart
WidgetbookComponent(
  name: 'Meu Componente',
  useCases: [
    WidgetbookUseCase(name: 'Default', builder: meuComponenteUseCase),
  ],
),
```

---

## Rodando o Widgetbook

```bash
# Web (recomendado para desenvolvimento)
flutter run -t lib/widgetbook/main.widgetbook.dart -d chrome

# macOS
flutter run -t lib/widgetbook/main.widgetbook.dart -d macos

# Windows
flutter run -t lib/widgetbook/main.widgetbook.dart -d windows

# Com hot reload ativo (padrão do flutter run)
# Edite qualquer arquivo e o catálogo atualiza automaticamente
```

---

## Componentes Implementados

### OkaButton
- **Tipos:** Primario · Secundário · Terciario · Link
- **Tamanhos:** Grande · Médio · Pequeno · Link
- **Lado do ícone:** Nenhum · Esquerda · Direita
- **Estados:** Ativo · Desabilitado
- **Knobs:** label, tipo, tamanho, iconSide, isDisabled

### OkaInput
- **Variações:** Texto · Telefone
- **Estados:** Habilitado · Visualização · Desabilitado · Erro
- **Knobs:** label, placeholder, helperText, errorText, prefixIcon, variation, state

### OkaAlert
- **Status:** Alerta · Neutro/Negativo · Positivo
- **Variações:** Simples · Com título · Botão ao lado · Botão embaixo
- **Knobs:** status, variation, title, message, actionLabel

### OkaTag
- **Status:** Novidade · Ativo · Desativado · Cancelado · Pendente · Neutro
- **Knobs:** status

### OkaPill
- **Variações:** Em linha · Empilhado
- **Knobs:** variation, options (lista de strings)

### OkaListItem
- **Variações:** Default · Default+Botão · Default+Tag Lateral · Default+Tag Título · Default+Info Título · Ícone+Background · Ícone+Background+Botão · Ícone+Background+Tag Lateral
- **Knobs:** variation, title, subtitle, tagStatus

---

## Tokens Disponíveis

### Importação

```dart
import 'package:oka_widgetbook/design_system/tokens/oka_tokens.dart';
```

### Cores
```dart
OkaColors.brandPrimary    // #4059d7
OkaColors.textDefault     // #424242
OkaColors.bgLight         // #ffffff
OkaColors.stateError      // #e1190c
```

### Tipografia
```dart
OkaTypography.headingLarge700  // Montserrat Bold 24/32
OkaTypography.body600          // Montserrat SemiBold 14/20
OkaTypography.labelL           // Montserrat Bold 16/24
```

### Espaçamento
```dart
OkaSpacing.micro   // 8
OkaSpacing.xs      // 16
OkaSpacing.xxs     // 24
OkaBorderRadius.small   // 8
OkaBorderRadius.medium  // 16
```

---

## Problemas Comuns

**Montserrat não carrega:**
Verifique se `google_fonts` está no `pubspec.yaml` e rode `flutter pub get`.

**Widgetbook não abre:**
Confirme que está apontando para `-t lib/widgetbook/main.widgetbook.dart` e não para `lib/main.dart`.

**Knob não aparece:**
O knob precisa ser chamado dentro da função `builder` do use case — nunca fora dela.

**Build runner falha:**
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```
