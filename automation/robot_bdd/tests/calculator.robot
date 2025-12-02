language: pt
encoding: utf-8

*** Settings ***
Documentation    Testes BDD da Calculadora Flutter executados com Robot Framework + Appium.
Resource         ../resources/CalculatorKeywords.resource
Suite Setup      Abrir Aplicativo
Suite Teardown   Fechar Aplicativo

force tags       calculator

*** Test Cases ***

Cenário: Soma de dois números inteiros
    [Documentation]    Verifica a operação de adição com números inteiros.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "7"
    E eu toco no botão "+"
    E eu digito "5"
    E eu toco no botão "="
    Então o display deve mostrar     12
    E o histórico deve exibir "7 + 5 = 12"

Cenário: Soma de números decimais
    [Documentation]    Verifica a operação de adição com decimais.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    2    .    5
    E eu toco no botão "+"
    E eu digito a sequência    3    .    7
    E eu toco no botão "="
    Então o display deve mostrar     6.2
    E o histórico deve exibir "2.5 + 3.7 = 6.2"

Cenário: Subtração com resultado negativo
    [Documentation]    Garante que subtrações podem resultar em números negativos.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "5"
    E eu toco no botão "-"
    E eu digito a sequência    1    0
    E eu toco no botão "="
    Então o display deve mostrar     -5
    E o histórico deve exibir "5 - 10 = -5"

Cenário: Multiplicação por zero
    [Documentation]    Valida multiplicação por zero.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "5"
    E eu toco no botão "x"
    E eu digito "0"
    E eu toco no botão "="
    Então o display deve mostrar     0
    E o histórico deve exibir "5 x 0 = 0"

Cenário: Divisão por zero
    [Documentation]    Valida multiplicação por zero.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "5"
    E eu toco no botão "/"
    E eu digito "0"
    E eu toco no botão "="
    Então o display deve mostrar     0
    E o histórico deve exibir "5 / 0 = 0"

Cenário: Divisão inteira
    [Documentation]    Verifica divisão simples.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    1    0
    E eu toco no botão "/"
    E eu digito "2"
    E eu toco no botão "="
    Então o display deve mostrar     5
    E o histórico deve exibir "10 / 2 = 5"

Cenário: Cálculo de módulo
    [Documentation]    Verifica operação de módulo.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    1    0
    E eu toco no botão "%"
    E eu digito "3"
    E eu toco no botão "="
    Então o display deve mostrar     1
    E o histórico deve exibir "10 % 3 = 1"

Cenário: Limpar com AC
    [Documentation]    Garante que o botão AC limpa display e histórico.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    5    3
    E eu toco no botão "AC"
    Então o display deve mostrar     0
    E o histórico deve exibir "Sem histórico"

Cenário: Operações em cadeia
    [Documentation]    Valida sequência de operações encadeadas.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito "8"
    E eu toco no botão "+"
    E eu digito "2"
    E eu toco no botão "="
    Então o display deve mostrar     10
    Quando eu toco no botão "x"
    E eu digito "5"
    E eu toco no botão "="
    Então o display deve mostrar     50

Cenário: Limite de 21 caracteres
    [Documentation]    Garante que o display limita a 21 caracteres.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    1    2    3    4    5    6    7    8    9    0    1    2    3    4    5    6    7    8    9    0    .    1
    Então o display deve ter no máximo 21 caracteres
    E o display deve mostrar     12345678901234567890.

Cenário: Histórico mantém últimas duas operações
    [Documentation]    Verifica que apenas as duas últimas operações ficam visíveis.
    Dado que o aplicativo da calculadora está aberto
    Quando eu digito a sequência    2    +    2
    E eu toco no botão "="
    E eu digito a sequência    x    3
    E eu toco no botão "="
    E eu digito a sequência    -    5
    E eu toco no botão "="
    Então o histórico deve exibir "4 x 3 = 12"
    E o histórico deve exibir "12 - 5 = 7"
    E o histórico não deve exibir "2 + 2 = 4"
