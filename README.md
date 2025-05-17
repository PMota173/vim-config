# Resumo Personalizado - Vim / Neovim

## Modos de Navegação e Edição
- `Ctrl-o` / `Ctrl-i`: navegar pelo histórico de cursor  
- `gi`: voltar para último local editado  
- `:changes`, `g;`, `g,`: ver e navegar entre mudanças  

## Registros e Clipboard
- `"+p` ou `"*p`: cola do sistema  
- `"0p`: cola último yank  
- `"_d`: delete sem alterar clipboard  
- `"ay` / `"ap`: copiar/colar registro `a`  

## Macros
- `qa`: começa a gravar macro no registro `a`  
- `q`: para de gravar  
- `@a`: executa macro `a`  
- `@@`: repete último macro  

## NERDTree e FZF
- `<leader>vp`: toggle NERDTree  
- `<C-p>`: fuzzy find arquivos com fzf  
- `<leader>pf`: abrir Files (fzf)  

## LSP e Autocomplete
- `gd`: ir para definição  
- `K`: hover info  
- `gr`, `gi`: referências e implementação  
- `<leader>rn`: renomear símbolo  
- `<leader>ca`: ação de código  
- `nvim-cmp`: `<C-n>` / `<C-p>` navega sugestões, `<C-y>` confirma  

## Movimentação e Manipulação Visual
- `J` / `K` em visual: mover linhas  
- `gv`: re-selecionar última seleção visual  
- `:m .+1` / `:m .-2`: mover linha para baixo/ cima  

## ALE (Lint e Formatação)
- `ale_fix_on_save=1`: autoformat ao salvar  
- `:ALEFix` para corrigir manualmente  
- `:ALEToggle` para ativar/desativar  

## Reload da Config
- `<leader><CR>`: recarregar init.vim (`:so`)  

## Execução rápida de scripts
- `<leader>r`: salvar e rodar arquivo atual (ex: python3)  

## Atalhos com `<leader>`
- `<leader>y`: copiar para clipboard  
- `<leader>Y`: copiar o arquivo todo  
- `<leader>pv`: abrir NERDTree com `:Vex`  
- `<leader>p`: paste visual inteligente  
- `<leader><CR>`: recarregar config  

