# Supprime les dossiers de démo
Remove-Item -Recurse -Force .\demos

# Supprime tous les fichiers desktop.ini
Get-ChildItem -Path . -Filter "desktop.ini" -Recurse | Remove-Item -Force

# Supprime les dossiers d'images inutilisés (adapte selon ce que tu gardes)
$imagesToKeep = @(
    "img", "logo-youme.png", "logo-youme@2x.png"
)
Get-ChildItem -Path .\images -Directory | Where-Object { $imagesToKeep -notcontains $_.Name } | Remove-Item -Recurse -Force
Get-ChildItem -Path .\images -File | Where-Object { $imagesToKeep -notcontains $_.Name } | Remove-Item -Force

# Supprime les CSS inutiles (adapte selon ce que tu utilises)
$cssToKeep = @(
    "custom.css", "font-icons.css", "swiper.css"
)
Get-ChildItem -Path .\css -File | Where-Object { $cssToKeep -notcontains $_.Name } | Remove-Item -Force
Remove-Item -Recurse -Force .\css\components
Remove-Item -Recurse -Force .\css\icons

# Supprime les JS inutiles (adapte selon ce que tu utilises)
$jsToKeep = @(
    "plugins.min.js", "functions.bundle.js"
)
Get-ChildItem -Path .\js -File | Where-Object { $jsToKeep -notcontains $_.Name } | Remove-Item -Force
Remove-Item -Recurse -Force .\js\modules
Remove-Item -Recurse -Force .\js\components
Remove-Item -Recurse -Force .\js\particles

# Supprime les includes inutiles (adapte selon tes besoins)
Remove-Item -Recurse -Force .\include\twitter
Remove-Item -Recurse -Force .\include\rs-plugin
Remove-Item -Recurse -Force .\include\phpmailer
Remove-Item -Recurse -Force .\include\instagram
Remove-Item -Recurse -Force .\include\getresponse
Remove-Item -Recurse -Force .\include\campaign-monitor
Remove-Item -Recurse -Force .\include\ajax
Get-ChildItem -Path .\include -File | Where-Object { $_.Name -ne "form.php" } | Remove-Item -Force

Write-Host "Nettoyage terminé !"