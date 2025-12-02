*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           String

*** Variables ***
${APPIUM_SERVER}              http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}              Android
${DEVICE_NAME}                emulator-5554
${AUTOMATION_NAME}            UiAutomator2
${APP}                        ${EXECDIR}/build/app/outputs/flutter-apk/app-debug.apk
${APP_PACKAGE}                com.example.calculadora_flutter
${APP_ACTIVITY}               com.example.calculadora_flutter.MainActivity
${NO_RESET}                   ${False}
${NEW_COMMAND_TIMEOUT}        240
${DEFAULT_TIMEOUT}            5s
${DISPLAY_LOCATOR}            accessibility_id=Sem histórico
${HISTORY_LOCATOR}            accessibility_id=history
${BUTTON_LOCATOR_TEMPLATE}    accessibility_id="%s"

*** Keywords ***
Abrir Aplicativo
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    app=${APP}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    noReset=${NO_RESET}    newCommandTimeout=${NEW_COMMAND_TIMEOUT}

Fechar Aplicativo
    Click Element    accessibility_id=AC
    Close All Applications

Aplicativo Deve Estar Pronto
    Wait Until Element Is Visible    accessibility_id=Sem histórico    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    accessibility_id=AC    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    accessibility_id=/    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    accessibility_id=x    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    accessibility_id=-    ${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    accessibility_id==    ${DEFAULT_TIMEOUT}

Tap Calculator Button
    [Arguments]    ${label}
    Click Element    accessibility_id=${label}

Display Deve Mostrar
    [Arguments]    ${valor_esperado}
    Wait Until Element Is Visible    ${DISPLAY_LOCATOR}    ${DEFAULT_TIMEOUT}
    ${texto}=    Get Text    ${DISPLAY_LOCATOR}
    Should Be Equal As Strings    ${texto}    ${valor_esperado}    Display incorreto: esperado "${valor_esperado}", obtido "${texto}"

Historico Deve Conter
    [Arguments]    ${trecho}
    Wait Until Page Contains    ${trecho}    timeout=${DEFAULT_TIMEOUT}

Historico Nao Deve Conter
    [Arguments]    ${trecho}
    Wait Until Page Does Not Contain    ${trecho}    timeout=${DEFAULT_TIMEOUT}

Display Deve Ter Limite
    [Arguments]    ${max_caracteres}
    ${texto}=    Get Text    ${DISPLAY_LOCATOR}
    ${tamanho}=    Get Length    ${texto}
    Should Be True    ${tamanho} <= ${max_caracteres}    Display com ${tamanho} caracteres, limite é ${max_caracteres}

que o aplicativo da calculadora está aberto
    Aplicativo Deve Estar Pronto

eu digito "${valor}"
    Tap Calculator Button    ${valor}

eu toco no botão "${valor}"
    Tap Calculator Button    ${valor}

eu digito a sequência
    [Arguments]    @{sequencia}
    FOR    ${item}    IN    @{sequencia}
        Tap Calculator Button    ${item}
    END

o display deve Mostrar
    [Arguments]    ${valor}
    Wait Until Element Is Visible    accessibility_id=${valor}    ${DEFAULT_TIMEOUT}
    Page Should Contain Text    ${valor}

o histórico deve exibir "${valor}"
    Historico Deve Conter    ${valor}

o histórico não deve exibir "${valor}"
    Historico Nao Deve Conter    ${valor}

o display deve ter no máximo ${limite} caracteres
    Display Deve Ter Limite    ${limite}
