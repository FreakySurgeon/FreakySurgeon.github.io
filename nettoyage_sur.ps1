# =============================================================
# SCRIPT DE NETTOYAGE SÛR ET PROGRESSIF
# Pour le site You.me - Manu
# =============================================================

Write-Host "=== NETTOYAGE SÛR DU SITE YOU.ME ===" -ForegroundColor Green
Write-Host "Ce script ne supprime QUE les fichiers manifestement inutiles." -ForegroundColor Yellow
Write-Host ""

# =============================================================
# ÉTAPE 1 : Suppression des fichiers de démo (sûrs)
# =============================================================
Write-Host "ÉTAPE 1 : Suppression des fichiers de démo..." -ForegroundColor Cyan

# Supprime les fichiers de démo HTML
if (Test-Path "demo-restaurant-about-us.html") {
    Remove-Item "demo-restaurant-about-us.html" -Force
    Write-Host "✓ Supprimé : demo-restaurant-about-us.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-blog.html") {
    Remove-Item "demo-restaurant-blog.html" -Force
    Write-Host "✓ Supprimé : demo-restaurant-blog.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-gallery.html") {
    Remove-Item "demo-restaurant-gallery.html" -Force
    Write-Host "✓ Supprimé : demo-restaurant-gallery.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-menu.html") {
    Remove-Item "demo-restaurant-menu.html" -Force
    Write-Host "✓ Supprimé : demo-restaurant-menu.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-reservation.html") {
    Remove-Item "demo-restaurant-reservation.html" -Force
    Write-Host "✓ Supprimé : demo-restaurant-reservation.html" -ForegroundColor Green
}

# Supprime le dossier demos complet
if (Test-Path "demos") {
    Remove-Item -Recurse -Force "demos"
    Write-Host "✓ Supprimé : dossier demos/" -ForegroundColor Green
}

# =============================================================
# ÉTAPE 2 : Suppression des fichiers desktop.ini (sûrs)
# =============================================================
Write-Host ""
Write-Host "ÉTAPE 2 : Suppression des fichiers desktop.ini..." -ForegroundColor Cyan

$desktopIniFiles = Get-ChildItem -Path . -Filter "desktop.ini" -Recurse
if ($desktopIniFiles.Count -gt 0) {
    $desktopIniFiles | Remove-Item -Force
    Write-Host "✓ Supprimé : $($desktopIniFiles.Count) fichiers desktop.ini" -ForegroundColor Green
} else {
    Write-Host "ℹ Aucun fichier desktop.ini trouvé" -ForegroundColor Gray
}

# =============================================================
# ÉTAPE 3 : Nettoyage des images (sélectif)
# =============================================================
Write-Host ""
Write-Host "ÉTAPE 3 : Nettoyage des images..." -ForegroundColor Cyan

# Liste des dossiers d'images à CONSERVER (ne pas supprimer)
$imagesToKeep = @(
    "img",                    # Tes images personnalisées
    "logo-youme.png",         # Logo principal
    "logo-youme@2x.png"       # Logo haute résolution
)

# Liste des dossiers d'images à SUPPRIMER (manifestement inutiles)
$imagesToRemove = @(
    "about", "appshowcase", "author", "blocks", "blog", "blogs", "chefs", "clients",
    "events", "extras", "featured", "forms", "gallery", "icons", "ils", "intro",
    "items", "landing", "lightbox", "magazine", "menu", "modals", "others",
    "parallax", "portfolio", "psd", "restaurant", "sections", "services",
    "shape-divider", "shop", "slider", "splash", "svg", "team", "testimonials",
    "videos", "wedding"
)

if (Test-Path "images") {
    foreach ($folder in $imagesToRemove) {
        $folderPath = "images\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "✓ Supprimé : images/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# ÉTAPE 4 : Nettoyage des includes (sélectif)
# =============================================================
Write-Host ""
Write-Host "ÉTAPE 4 : Nettoyage des includes..." -ForegroundColor Cyan

# Dossiers includes à supprimer (non utilisés)
$includesToRemove = @(
    "twitter", "rs-plugin", "phpmailer", "instagram", "getresponse", 
    "campaign-monitor", "ajax"
)

if (Test-Path "include") {
    foreach ($folder in $includesToRemove) {
        $folderPath = "include\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "✓ Supprimé : include/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# ÉTAPE 5 : Nettoyage des JS (sélectif)
# =============================================================
Write-Host ""
Write-Host "ÉTAPE 5 : Nettoyage des JS..." -ForegroundColor Cyan

# Dossiers JS à supprimer (non utilisés)
$jsFoldersToRemove = @(
    "modules", "components", "particles"
)

if (Test-Path "js") {
    foreach ($folder in $jsFoldersToRemove) {
        $folderPath = "js\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "✓ Supprimé : js/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# ÉTAPE 6 : Nettoyage des CSS (sélectif)
# =============================================================
Write-Host ""
Write-Host "ÉTAPE 6 : Nettoyage des CSS..." -ForegroundColor Cyan

# Dossiers CSS à supprimer (non utilisés)
$cssFoldersToRemove = @(
    "components"
)

if (Test-Path "css") {
    foreach ($folder in $cssFoldersToRemove) {
        $folderPath = "css\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "✓ Supprimé : css/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# RÉSUMÉ FINAL
# =============================================================
Write-Host ""
Write-Host "=== NETTOYAGE TERMINÉ ===" -ForegroundColor Green
Write-Host ""
Write-Host "Fichiers CONSERVÉS (essentiels) :" -ForegroundColor Yellow
Write-Host "  ✓ index.html" -ForegroundColor Green
Write-Host "  ✓ style.css" -ForegroundColor Green
Write-Host "  ✓ css/font-icons.css" -ForegroundColor Green
Write-Host "  ✓ css/swiper.css" -ForegroundColor Green
Write-Host "  ✓ css/custom.css" -ForegroundColor Green
Write-Host "  ✓ restaurant.css" -ForegroundColor Green
Write-Host "  ✓ one-page/css/et-line.css" -ForegroundColor Green
Write-Host "  ✓ js/plugins.min.js" -ForegroundColor Green
Write-Host "  ✓ js/functions.bundle.js" -ForegroundColor Green
Write-Host "  ✓ images/img/ (tes images)" -ForegroundColor Green
Write-Host "  ✓ images/logo-youme.png" -ForegroundColor Green
Write-Host "  ✓ sitemap.xml" -ForegroundColor Green
Write-Host "  ✓ robots.txt" -ForegroundColor Green
Write-Host ""
Write-Host "Le site devrait maintenant être plus léger et fonctionnel !" -ForegroundColor Green 