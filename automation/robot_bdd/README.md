# 📱 Calculadora Flutter - Automação BDD

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-00C0B5?style=for-the-badge&logo=robot-framework&logoColor=white)
![Appium](https://img.shields.io/badge/Appium-662DA5?style=for-the-badge&logo=appium&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

Projeto de automação de testes *end-to-end* para o aplicativo **Calculadora Flutter**, utilizando **Robot Framework**, **Appium** e a metodologia **BDD (Behavior Driven Development)**.

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Execução dos Testes](#-execução-dos-testes)
- [Cenários Cobertos](#-cenários-cobertos)

---

## 📖 Sobre o Projeto

Este projeto visa garantir a qualidade das funcionalidades críticas da calculadora através de testes automatizados que simulam o comportamento do usuário final. Os testes são escritos em Gherkin (PT-BR), facilitando o entendimento por todos os membros do time.

## 📂 Estrutura do Projeto

```text
automation/robot_bdd/
├── config/                     # Arquivos de configuração globais
├── resources/
│   └── CalculatorKeywords.resource   # Keywords (Passos) e configurações do Appium
├── tests/
│   └── calculator.robot              # Arquivo de teste com cenários BDD (Gherkin)
├── requirements.txt            # Dependências Python do projeto
└── README.md                   # Documentação do projeto
```

## 🔧 Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- **Python 3.10+**
- **Node.js 18+** (para o Appium)
- **Java JDK 11+** (para o Android SDK)
- **Android SDK** configurado
- **Appium Server** (v2.0+)

### Instalação do Appium e Drivers

```bash
# Instalar o Appium globalmente
npm install -g appium

# Instalar o Appium Doctor para verificar dependências
npm install -g @appium/doctor

# Instalar o driver para Android (UiAutomator2)
appium driver install uiautomator2

# (Opcional) Instalar driver para Flutter
appium driver install --source=npm appium-flutter-driver
```

## 🚀 Instalação

1. Navegue até a pasta do projeto:
   ```bash
   cd automation/robot_bdd
   ```

2. Crie e ative um ambiente virtual Python:
   ```bash
   # Windows
   python -m venv .venv
   source .venv/Scripts/activate

   # Linux/macOS
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. Instale as dependências do projeto:
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

## ⚙️ Configuração

Antes de executar, verifique o arquivo `resources/CalculatorKeywords.resource` e ajuste as variáveis conforme seu ambiente:

| Variável | Descrição | Exemplo |
| :--- | :--- | :--- |
| `${APPIUM_SERVER}` | URL do servidor Appium | `http://127.0.0.1:4723/wd/hub` |
| `${DEVICE_NAME}` | Nome do emulador/device | `emulator-5554` |
| `${APP}` | Caminho do APK | `${EXECDIR}/app-debug.apk` |

> **Dica:** Para descobrir o `appPackage` e `appActivity` do seu app, com o app aberto no emulador, execute:
> `adb shell dumpsys window | grep -E "mCurrentFocus"`

## ▶️ Execução dos Testes

### 1. Iniciar o Servidor Appium

Como a configuração do projeto aponta para `/wd/hub`, inicie o servidor com o argumento `base-path`:

```bash
appium --base-path /wd/hub --allow-cors
appium -a 127.0.0.1 -pa wd/hub --allow-cors

```

### 2. Executar os Testes Robot

Com o servidor rodando e o emulador aberto, execute o comando:

```bash
robot -d ./output tests/calculator.robot
```

- O parâmetro `-d ./output` define onde os relatórios (Log e Report) serão salvos.

## ✅ Cenários Cobertos

Os testes validam os seguintes comportamentos:
- [x] Inicialização correta do app
- [x] Operações matemáticas básicas (+, -, *, /, %)
- [x] Tratamento de números decimais e negativos
- [x] Funcionalidade do botão "AC" (Limpar)
- [x] Limite de caracteres no display
- [x] Histórico de operações

---

Desenvolvido com 💙 para automação de testes.
