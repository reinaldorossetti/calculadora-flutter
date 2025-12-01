# 🧮 Calculadora Flutter

Uma calculadora moderna e elegante desenvolvida em Flutter com Material Design 3, featuring histórico de operações e suporte completo para operações matemáticas básicas.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![Material Design 3](https://img.shields.io/badge/Material-Design%203-757575?logo=material-design)

## 📋 Índice

- [Características](#-características)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Como Executar](#-como-executar)
- [Testes](#-testes)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Arquitetura](#-arquitetura)

## ✨ Características

- ✅ **Material Design 3** - Interface moderna e responsiva
- 🧮 **Operações Básicas** - Adição, subtração, multiplicação, divisão e módulo
- 📜 **Histórico** - Exibe as últimas 2 operações realizadas
- 🎨 **Tema Dark** - Design elegante com cores personalizáveis
- 🔢 **Números Decimais** - Suporte completo para operações com decimais
- ⚡ **Operações em Cadeia** - Execute múltiplas operações sequencialmente
- 🧪 **35 Testes Unitários** - Cobertura completa de funcionalidades
- 🔬 **Testes de Widget** - Testes integrados da interface

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Flutter SDK** (>=2.18.2 <3.38.0)
- **Dart SDK** (incluído com Flutter)
- **Android Studio** ou **VS Code** com extensões Flutter
- **Emulador Android/iOS** ou dispositivo físico

Para verificar sua instalação:

```bash
flutter doctor
```

## 🚀 Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/reinaldorossetti/calculadora-flutter.git
cd calculadora-flutter
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Verifique dispositivos disponíveis

```bash
flutter devices
```

## ▶️ Como Executar

### Modo Debug

```bash
flutter run
```

### Modo Release

```bash
flutter run --release
```

### Executar em dispositivo específico

```bash
flutter run -d <device_id>
```

### Hot Reload

Enquanto o app estiver rodando, pressione:
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

## 🧪 Testes

O projeto possui duas suítes de testes:

### Executar todos os testes

```bash
flutter test
```

### Executar testes unitários

```bash
flutter test test/memory_test.dart
```

### Executar testes de widget

```bash
flutter test test/calculator_widget_test.dart
```

### Executar com relatório detalhado

```bash
flutter test --reporter expanded
```

### Cobertura de testes

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📁 Estrutura do Projeto

```
calculadora_flutter/
├── lib/
│   ├── main.dart                    # Ponto de entrada da aplicação
│   ├── components/                  # Componentes reutilizáveis
│   │   ├── button.dart             # Widget customizado de botão
│   │   ├── button_row.dart         # Layout de linha de botões
│   │   ├── display.dart            # Display da calculadora
│   │   └── keyboard.dart           # Teclado numérico
│   ├── models/                      # Modelos de dados
│   │   └── memory.dart             # Lógica de negócio e cálculos
│   └── screens/                     # Telas da aplicação
│       └── calculator.dart         # Tela principal
├── test/
│   ├── memory_test.dart            # 35 testes unitários
│   └── calculator_widget_test.dart # Testes integrados
├── android/                         # Configurações Android
├── ios/                            # Configurações iOS
├── web/                            # Configurações Web
├── windows/                        # Configurações Windows
├── linux/                          # Configurações Linux
├── macos/                          # Configurações macOS
├── dev_assets/                     # Assets de desenvolvimento
├── pubspec.yaml                    # Dependências do projeto
└── README.md                       # Documentação

```

## 📄 Descrição dos Arquivos

### `/lib/main.dart`

Ponto de entrada da aplicação. Inicializa o widget `Calculator`.

```dart
void main() => runApp(const Calculator());
```

---

### `/lib/models/memory.dart`

**Responsabilidade:** Gerenciar toda a lógica de cálculos e estado da calculadora.

**Principais funcionalidades:**
- Armazena valores em buffer duplo para operações
- Processa comandos (números, operadores, funções)
- Mantém histórico das últimas 2 operações
- Implementa cálculos: `+`, `-`, `x`, `/`, `%`
- Função `AC` para limpar tudo
- Tratamento de divisão por zero

**Métodos principais:**
- `applyCommand(String command)` - Processa entrada do usuário
- `_calculate()` - Executa operações matemáticas
- `_addToHistory(String operation)` - Gerencia histórico
- `value` - Getter para valor atual
- `historyText` - Getter para texto do histórico formatado

---

### `/lib/screens/calculator.dart`

**Responsabilidade:** Tela principal que integra todos os componentes.

**Características:**
- StatefulWidget para gerenciar estado
- Configura tema Material Design 3
- Define orientação portrait
- Integra Display e Keyboard
- Passa callbacks para atualização de estado

---

### `/lib/components/display.dart`

**Responsabilidade:** Exibir resultado e histórico.

**Características:**
- Mostra valor atual em fonte grande (72px)
- Exibe histórico em fonte menor (16px) no topo
- Gradiente de fundo usando cores do tema
- Auto-redimensionamento de texto com `auto_size_text`
- Suporte a números grandes sem overflow

---

### `/lib/components/keyboard.dart`

**Responsabilidade:** Layout completo do teclado numérico.

**Organização:**
- 5 linhas de botões
- Linha 1: `AC`, `%`, `/`
- Linha 2: `7`, `8`, `9`, `x`
- Linha 3: `4`, `5`, `6`, `-`
- Linha 4: `1`, `2`, `3`, `+`
- Linha 5: `0` (duplo), `.`, `=`

---

### `/lib/components/button.dart`

**Responsabilidade:** Widget customizado de botão com estilos.

**Tipos de botão:**
- `ButtonType.normal` - Números (cinza médio)
- `ButtonType.dark` - Funções AC, % (cinza escuro)
- `ButtonType.operation` - Operadores +, -, x, / (roxo)

**Características:**
- FilledButton do Material Design 3
- Bordas arredondadas (16px)
- Padding responsivo
- Elevação diferenciada para operadores
- Suporte a botão duplo (zero)

---

### `/lib/components/button_row.dart`

**Responsabilidade:** Container para organizar botões horizontalmente.

**Características:**
- Expanded flex para ocupar espaço disponível
- Distribui botões uniformemente
- Adiciona espaçamento de 1px entre botões

---

### `/test/memory_test.dart`

**Suíte de testes unitários com 35 casos de teste (CT01-CT35):**

**Grupos de teste:**
1. **Operações Básicas** (CT01-CT04)
   - Inicialização, dígitos, decimais

2. **Adição** (CT05-CT08)
   - Inteiros, decimais, em cadeia

3. **Subtração** (CT09-CT12)
   - Inteiros, decimais, negativos

4. **Multiplicação** (CT13-CT16)
   - Inteiros, decimais, por zero

5. **Divisão** (CT17-CT20)
   - Inteiros, decimais, por zero, em cadeia

6. **Módulo** (CT21-CT23)
   - Resto, divisível, com decimais

7. **Função AC** (CT24-CT26)
   - Limpar valor, operação, histórico

8. **Histórico** (CT27-CT31)
   - Armazenar, limite de 2, formatação

9. **Casos Especiais** (CT32-CT35)
   - Trocar operador, zero à esquerda

---

### `/test/calculator_widget_test.dart`

**Testes integrados de interface:**

**Casos de teste:**
- `CTW01` - Soma simples com histórico
- `CTW02` - Cálculos encadeados
- `CTW03` - Função AC limpa tudo

**Funções auxiliares:**
- `_tapSequence()` - Simula sequência de toques
- `_buttonFinder()` - Localiza botões por texto
- `_displayValue()` - Extrai valor do display

---

### `/pubspec.yaml`

**Configurações do projeto:**

**Dependências principais:**
- `flutter` - Framework
- `auto_size_text: ^3.0.0` - Auto-redimensionamento

**Dev dependencies:**
- `flutter_test` - Framework de testes
- `integration_test` - Testes integrados
- `flutter_launcher_icons` - Geração de ícones

**Configuração de ícones:**
- Android e iOS personalizados
- Ícone adaptativo para Android

## 🏗️ Arquitetura

O projeto segue uma arquitetura simples e organizada:

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│   (screens/calculator.dart)         │
│   - MaterialApp                     │
│   - Theme Configuration             │
│   - State Management                │
└─────────────┬───────────────────────┘
              │
              ├──────────────────────┐
              ▼                      ▼
┌──────────────────────┐  ┌──────────────────────┐
│  Components Layer    │  │   Business Logic     │
│  - Display           │  │   (models/memory.dart)│
│  - Keyboard          │  │   - Calculations     │
│  - Button            │  │   - State            │
│  - ButtonRow         │  │   - History          │
└──────────────────────┘  └──────────────────────┘
```

### Fluxo de Dados

1. **Usuário toca botão** → `Button.onPressed()`
2. **Callback executado** → `Calculator._onPressed(command)`
3. **Comando processado** → `Memory.applyCommand(command)`
4. **Estado atualizado** → `setState()`
5. **UI re-renderizada** → `Display` mostra novo valor

## 🎨 Personalização

### Alterar cores do tema

Edite `lib/screens/calculator.dart`:

```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.deepPurple, // Altere aqui
  brightness: Brightness.dark,
),
```

### Alterar tamanho de fonte

Edite `lib/components/display.dart`:

```dart
maxFontSize: 72, // Tamanho máximo
minFontSize: 24, // Tamanho mínimo
```

### Adicionar nova operação

1. Adicione operador em `Memory.operations`
2. Implemente caso em `Memory._calculate()`
3. Adicione botão em `Keyboard`
4. Crie testes unitários

## 📊 Métricas do Projeto

- **Linhas de código:** ~600
- **Testes unitários:** 35
- **Testes de widget:** 3
- **Cobertura de código:** >90%
- **Componentes reutilizáveis:** 4
- **Operações suportadas:** 5

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch: `git checkout -b feature/nova-funcionalidade`
3. Commit suas mudanças: `git commit -m 'Adiciona nova funcionalidade'`
4. Push para a branch: `git push origin feature/nova-funcionalidade`
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Reinaldo Rossetti**
- GitHub: [@reinaldorossetti](https://github.com/reinaldorossetti)

---

⭐ Se este projeto foi útil, considere dar uma estrela no repositório!
