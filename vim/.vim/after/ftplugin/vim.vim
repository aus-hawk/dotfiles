" Don't duplicate single and double quotes in comments
inoremap <expr> " getline('.')[col('.')-1] == "\"" ? "\<Right>" :
                \ col('.') == 1                    ? "\""       : "\"\"\<Left>"
