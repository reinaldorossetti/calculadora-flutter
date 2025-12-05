# 🧮 Calculadora Flutter

Uma calculadora moderna e elegante desenvolvida em Flutter com Material Design 3, featuring histórico de operações e suporte completo para operações matemáticas básicas.

![Flutter](https://img.shields.io/badge/Flutter-%3E%3D3.19.0-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-%3E%3D3.0.0-0175C2?logo=dart)
![Material Design 3](https://img.shields.io/badge/Material-Design%203-757575?logo=material-design)
![Tests](https://github.com/reinaldorossetti/calculadora-flutter/actions/workflows/flutter-test.yml/badge.svg)

## 📋 Índice

- [Características](#-características)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Como Executar](#-como-executar)
- [Testes](#-testes)
- [Análise de Código](#-análise-de-código)
- [CI/CD - GitHub Actions](#-cicd---github-actions)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Arquitetura](#-arquitetura)

## ✨ Características

- ✅ **Material Design 3** - Interface moderna e responsiva
- 🧮 **Operações Básicas** - Adição, subtração, multiplicação, divisão e módulo
- 📜 **Histórico** - Exibe as últimas 2 operações realizadas
- 🎨 **Tema Dark** - Design elegante com cores personalizáveis
- 🔢 **Números Decimais** - Suporte completo para operações com decimais
- ⚡ **Operações em Cadeia** - Execute múltiplas operações sequencialmente
- 🧪 **84 Testes Automatizados** - 35 unitários + 37 widgets + 12 E2E
- 📊 **Cobertura >90%** - Testes em 3 níveis (unitário, integração, E2E)

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- **Flutter SDK** (>=3.19.0)
- **Dart SDK** (">=3.24.0 <4.0.0", incluído com Flutter)
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

O projeto possui três níveis de testes: **unitários** (35), **integrados de widgets** (37) e **end-to-end** (12).

### 🔺 Pirâmide de Testes

Este projeto segue a **Pirâmide de Testes**, uma estratégia que prioriza testes rápidos e baratos na base, progredindo para testes mais complexos e caros no topo:

```
        /\
       /  \
      / E2E \      12 testes - Fluxos completos do usuário
     /------\
    /        \
   / Widget  \    37 testes - Integração de UI
  /----------\
 /            \
/  Unitários   \  35 testes - Lógica de negócio
----------------
```

**⭐⭐⭐ Vantagens da Pirâmide de Testes:**

- ✅ **Detecta problemas o mais cedo possível** - Testes unitários falham rapidamente quando a lógica está incorreta
- ⚡ **Execução rápida** - Maior parte dos testes são unitários, executados em milissegundos
- 🎯 **Fornece indicações claras quando algo precisa ser corrigido** - Falhas em testes unitários apontam exatamente onde está o problema

**Distribuição ideal mantida:**
- 📊 **42% Unitários** - Base sólida de testes de lógica (35/84)
- 📊 **44% Widgets** - Cobertura robusta de interface (37/84)
- 📊 **14% E2E** - Validação de fluxos críticos (12/84)

### 📊 Visão Geral dos Testes

| Tipo | Quantidade | Localização | Ferramenta |
|------|------------|-------------|------------|
| Unitários | 35 | `test/memory_test.dart` | Flutter Test |
| Widget/Integração | 37 | `integration_test/calculator_widget_test.dart` | Flutter Integration Test |
| End-to-End (E2E) | 12 | `automation/robot_bdd/tests/calculator.robot` | Robot Framework + Appium |
| **Total** | **84** | - | - |

### 🔬 1. Testes Unitários

Testes de lógica de negócio pura, sem interface gráfica.

**Executar:**
```bash
flutter test test/memory_test.dart
```

**Cobertura:**
- ✅ Operações básicas (inicialização, dígitos, decimais)
- ✅ Operações matemáticas (+, -, ×, ÷, %)
- ✅ Histórico de operações
- ✅ Casos especiais (zero à esquerda, múltiplos pontos, etc)

**Exemplo de teste unitário (CT05):**
```dart
test('CT05 - Deve somar dois números inteiros', () {
  memory.applyCommand('5');
  memory.applyCommand('+');
  memory.applyCommand('3');
  memory.applyCommand('=');
  expect(memory.value, '8');
});
```

### 🎨 2. Testes de Widget (Integração)

Testes de integração com interface Flutter, simulando interação do usuário.

**Executar:**
```bash
flutter test integration_test/calculator_widget_test.dart
```

**Cobertura:**
- ✅ Inicialização e comportamento dos botões
- ✅ Operações matemáticas através da interface
- ✅ Validação de histórico na UI
- ✅ Limite de 21 caracteres no display
- ✅ Operações complexas e encadeadas

**Exemplo de teste de widget (CTW05):**
```dart
testWidgets('CTW05 - Deve somar dois números inteiros', (tester) async {
  await tester.pumpWidget(const Calculator());
  await tester.pumpAndSettle();

  await _tapSequence(tester, ['7', '+', '5', '=']);

  expect(_displayValue(tester), '12');
  expect(find.textContaining('7 + 5 = 12'), findsOneWidget);
});
```

### 🤖 3. Testes End-to-End (E2E)

Testes BDD com Robot Framework + Appium em dispositivo/emulador real.

**Executar:**
```bash
cd automation/robot_bdd
robot tests/calculator.robot
```

**Cobertura (12 cenários - CT001 a CT012):**
- ✅ Operações aritméticas completas
- ✅ Validação de histórico em app real
- ✅ Limite de caracteres no display
- ✅ Formatação financeira (1.000.000,00)
- ✅ Fluxos completos de usuário

**Exemplo de teste E2E (CT001):**
```robotframework
Cenário: Soma de dois números inteiros
    [Documentation]    Verifica a operação de adição com números inteiros.
    [Tags]    CT001
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "7"
    E eu toco no botão "+"
    E eu digito "5"
    E eu toco no botão "="
    Então o display deve mostrar     12
    E o histórico deve exibir "7 + 5 = 12"
```

### 🚀 Executar Todos os Testes

**Testes Flutter (unitários + widgets):**
```bash
flutter test
```

**Com relatório detalhado:**
```bash
flutter test --reporter expanded
```

### Cobertura de testes

#### Gerar relatório de cobertura

```bash
flutter test --coverage
```

Este comando executa todos os testes e gera um arquivo `coverage/lcov.info` com os dados de cobertura.

#### Visualizar cobertura em HTML (Linux/macOS)

```bash
# Instalar lcov (se necessário)
# Ubuntu/Debian: sudo apt-get install lcov
# macOS: brew install lcov

# Gerar relatório HTML
genhtml coverage/lcov.info -o coverage/html
perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml coverage/lcov.info -o coverage/

# Abrir no navegador
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
```

#### Visualizar cobertura em HTML (Windows)

```bash
# Opção 1: Usar WSL com lcov
wsl genhtml coverage/lcov.info -o coverage/html

# Opção 2: Usar extensão do VS Code
# Instale: Coverage Gutters (ryanluker.vscode-coverage-gutters)
# A extensão lê automaticamente o lcov.info e exibe indicadores no editor
```

#### Filtrar cobertura por arquivo

```bash
# Visualizar cobertura no terminal
flutter test --coverage && lcov --list coverage/lcov.info

# Remover arquivos gerados do relatório
lcov --remove coverage/lcov.info '*.g.dart' '*.freezed.dart' -o coverage/lcov.info
```

#### Meta de cobertura

O projeto mantém **>90% de cobertura de código** com foco em:
- ✅ Lógica de negócio (`models/memory.dart`)
- ✅ Casos de uso críticos
- ✅ Operações matemáticas
- ✅ Tratamento de erros

## 🔍 Análise de Código

O projeto utiliza análise estática de código para manter a qualidade e detectar problemas potenciais.

### Executar análise de código

```bash
flutter analyze
```

### Verificar formatação

```bash
flutter format --set-exit-if-changed .
```

### Formatar código automaticamente

```bash
flutter format .
```

### Análise com métricas detalhadas

```bash
flutter analyze --write=analysis.txt
```

O projeto segue as regras de lint configuradas em `analysis_options.yaml` usando o pacote `flutter_lints` para garantir código limpo e seguindo as melhores práticas do Flutter.

## 🚀 CI/CD - GitHub Actions

O projeto possui dois pipelines automatizados de CI/CD que são executados a cada push ou pull request nas branches `main` e `develop`.

### 1️⃣ Pipeline de Testes Unitários

O workflow `.github/workflows/flutter-test.yml` executa:

1. **Setup do Ambiente**
   - Checkout do código
   - Instalação do Flutter 3.24.0
   - Cache de dependências para builds mais rápidos

2. **Verificações de Qualidade**
   - ✅ Verificação de formatação do código (`dart format`)
   - ✅ Análise estática com `flutter analyze --fatal-infos`
   - ✅ Execução de todos os testes unitários
   - ✅ Geração de relatório de cobertura

3. **Relatório de Cobertura**
   - Upload automático para Codecov (requer `CODECOV_TOKEN`)
   - Geração de HTML com relatório visual
   - Disponibilização do relatório como artefato (30 dias)
   - Summary da cobertura no GitHub Actions

4. **Critérios de Falha**
   - ❌ Código mal formatado
   - ❌ Warnings ou erros no analyze
   - ❌ Qualquer teste unitário falhando

### 2️⃣ Pipeline de Testes Integrados

O workflow `.github/workflows/flutter-integration-tests.yml` executa:

1. **Setup do Ambiente**
   - Checkout do código
   - Instalação do Flutter 3.24.0

2. **Provisionamento Android**
   - Baixa e configura o Android SDK (command-line tools mais recentes)
   - Aceita licenças e instala ferramentas `platform-tools`, `emulator`, `build-tools 34`
   - Cria automaticamente um AVD headless (Android 14 / API 34)

3. **Execução dos Testes**
   - Sobe o emulador em modo headless, desativa animações e desbloqueia a tela
   - Roda `flutter test integration_test/calculator_widget_test.dart --reporter=expanded`
   - Usa `tee` para gerar log legível sem suprimir falhas

4. **Artefatos e Limpeza**
   - Publica `integration-test-report.txt` (log detalhado) com retenção de 30 dias
   - Derruba o emulador ao final, mesmo em caso de falhas

### 3️⃣ Pipeline de Testes Integrados (ReactiveCircus)

O workflow `.github/workflows/flutter-integration-tests-reactive.yml` usa a ação `reactivecircus/android-emulator-runner@v2` para provisionar o emulador automaticamente:

1. **Provisionamento Simplificado**
   - Setup automático de SDK + AVD via Action
   - Emulador Android 14 (API 34), perfil Nexus 6P

2. **Execução dos Testes**
   - Roda `flutter test integration_test/calculator_widget_test.dart --reporter=expanded`
   - Logs redirecionados via `tee` para auditoria

3. **Artefatos**
   - Publica `integration-test-report-reactivecircus` com retenção de 30 dias

Esse pipeline é ideal para cenários em que se deseja reduzir o boilerplate de configuração manual do SDK dentro da esteira.

### Visualizar Resultados

- **GitHub Actions**: Vá em `Actions` no repositório para ver os runs de ambos os pipelines
- **Relatório de Cobertura**: Baixe o artefato `coverage-report` do run de testes unitários
- **Resultados de Integração**: Baixe o artefato `integration-test-report` do run padrão ou `integration-test-report-reactivecircus` do pipeline com ReactiveCircus
- **Codecov**: Visualize métricas detelhadas em codecov.io (se configurado)

### Badges de Status

```markdown
![Unit Tests](https://github.com/reinaldorossetti/calculadora-flutter/actions/workflows/flutter-test.yml/badge.svg)
![Integration Tests](https://github.com/reinaldorossetti/calculadora-flutter/actions/workflows/flutter-integration-tests.yml/badge.svg)
```

### Configurar Codecov (Opcional)

1. Acesse [codecov.io](https://codecov.io) e conecte seu repositório
2. Copie o token fornecido
3. Adicione como secret no GitHub: `Settings` → `Secrets and variables` → `Actions` → `CODECOV_TOKEN`

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
│   └── memory_test.dart            # 35 testes unitários (CT01-CT35)
├── integration_test/                # Testes de integração
│   └── calculator_widget_test.dart # 37 testes de widget (CTW01-CTW37)
├── test_driver/                     # Driver de testes integrados
│   └── integration_test.dart       # Captura de screenshots
├── .github/workflows/               # Pipelines CI/CD
│   ├── flutter-test.yml            # Testes unitários com cobertura
│   ├── flutter-integration-tests.yml # Testes de integração (manual)
│   └── flutter-integration-tests-reactive.yml # Testes com ReactiveCircus
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

### `/integration_test/calculator_widget_test.dart`

**Testes integrados de interface com 37 casos de teste:**

**Grupos principais:**
1. **Operações Básicas** (CTW01-CTW04)
   - Inicialização com 0
   - Adição de dígitos
   - Pontos decimais

2. **Operações Matemáticas** (CTW05-CTW21)
   - Adição, subtração, multiplicação, divisão, módulo
   - Operações em cadeia
   - Números inteiros e decimais

3. **Função AC e Histórico** (CTW22-CTW27)
   - Limpeza de valores
   - Armazenamento de histórico
   - Limite de 2 operações

4. **Casos Especiais** (CTW28-CTW37)
   - Formatação de números
   - Troca de operador
   - Limite de 21 caracteres
   - Operações complexas

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
- **Testes unitários:** 35 (CT01-CT35)
- **Testes de widget:** 37 (CTW01-CTW37)
- **Testes E2E:** 12 (CT001-CT012)
- **Total de testes:** 84
- **Cobertura de código:** >90%
- **Componentes reutilizáveis:** 4
- **Operações suportadas:** 5 (+, -, ×, ÷, %)

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
