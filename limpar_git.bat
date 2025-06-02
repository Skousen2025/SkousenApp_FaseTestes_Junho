@echo off
echo Adicionando node_modules/ ao .gitignore...
echo node_modules/>>.gitignore

echo.
echo Removendo arquivo grande do Git...
git rm --cached node_modules/@next/swc-win32-x64-msvc/next-swc.win32-x64-msvc.node

echo.
echo Fazendo commit da remocao do arquivo grande...
git commit -m "Remove arquivo grande do node_modules do Git"

echo.
echo Reescrevendo histórico para limpar o arquivo grande...
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch node_modules/@next/swc-win32-x64-msvc/next-swc.win32-x64-msvc.node" --prune-empty --tag-name-filter cat -- --all

echo.
echo Limpando cache temporário do Git...
del /s /q .git\refs\original
del /s /q .git\logs
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo.
echo Fazendo push forçado para o GitHub...
git push origin main --force

echo.
echo Processo concluído!
pause
