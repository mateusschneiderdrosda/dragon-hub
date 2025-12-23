-- [[ REDZ HUB STYLE LOADER ]] --
-- Este é o script que você executa no seu executor (ex: Solara, Wave, etc.)

print("--- Redz Hub Loader ---")

-- Função para carregar scripts (Simulando carregamento remoto)
local function loadRemote(url, name)
    print("Baixando " .. name .. "...")
    -- Em um executor real, use: loadstring(game:HttpGet(url))()
    -- Como estamos em ambiente de desenvolvimento, apenas notificamos
    print("Sucesso: " .. name .. " pronto para execução.")
end

-- Exemplo de como o usuário usaria:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuario/SeuRepo/main/ui_library.lua"))()
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuario/SeuRepo/main/main_logic.lua"))()

print("Dica: Hospede os arquivos ui_library.lua e main_logic.lua no GitHub para usar o Loader corretamente.")
print("-----------------------")
