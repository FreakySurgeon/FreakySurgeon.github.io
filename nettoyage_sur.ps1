# =============================================================
# SAFE CLEANUP SCRIPT
# For You.me website - Manu
# =============================================================

Write-Host "=== SAFE CLEANUP FOR YOU.ME WEBSITE ===" -ForegroundColor Green
Write-Host "This script only removes clearly unnecessary files." -ForegroundColor Yellow
Write-Host ""

# =============================================================
# STEP 1: Remove demo files (safe)
# =============================================================
Write-Host "STEP 1: Removing demo files..." -ForegroundColor Cyan

# Remove demo HTML files
if (Test-Path "demo-restaurant-about-us.html") {
    Remove-Item "demo-restaurant-about-us.html" -Force
    Write-Host "Removed: demo-restaurant-about-us.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-blog.html") {
    Remove-Item "demo-restaurant-blog.html" -Force
    Write-Host "Removed: demo-restaurant-blog.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-gallery.html") {
    Remove-Item "demo-restaurant-gallery.html" -Force
    Write-Host "Removed: demo-restaurant-gallery.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-menu.html") {
    Remove-Item "demo-restaurant-menu.html" -Force
    Write-Host "Removed: demo-restaurant-menu.html" -ForegroundColor Green
}
if (Test-Path "demo-restaurant-reservation.html") {
    Remove-Item "demo-restaurant-reservation.html" -Force
    Write-Host "Removed: demo-restaurant-reservation.html" -ForegroundColor Green
}

# Remove demos folder completely
if (Test-Path "demos") {
    Remove-Item -Recurse -Force "demos"
    Write-Host "Removed: demos/ folder" -ForegroundColor Green
}

# =============================================================
# STEP 2: Remove desktop.ini files (safe)
# =============================================================
Write-Host ""
Write-Host "STEP 2: Removing desktop.ini files..." -ForegroundColor Cyan

$desktopIniFiles = Get-ChildItem -Path . -Filter "desktop.ini" -Recurse
if ($desktopIniFiles.Count -gt 0) {
    $desktopIniFiles | Remove-Item -Force
    Write-Host "Removed: $($desktopIniFiles.Count) desktop.ini files" -ForegroundColor Green
} else {
    Write-Host "No desktop.ini files found" -ForegroundColor Gray
}

# =============================================================
# STEP 3: Clean images (selective)
# =============================================================
Write-Host ""
Write-Host "STEP 3: Cleaning images..." -ForegroundColor Cyan

# List of image folders to REMOVE (clearly unnecessary)
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
            Write-Host "Removed: images/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# STEP 4: Clean includes (selective)
# =============================================================
Write-Host ""
Write-Host "STEP 4: Cleaning includes..." -ForegroundColor Cyan

# Include folders to remove (not used)
$includesToRemove = @(
    "twitter", "rs-plugin", "phpmailer", "instagram", "getresponse", 
    "campaign-monitor", "ajax"
)

if (Test-Path "include") {
    foreach ($folder in $includesToRemove) {
        $folderPath = "include\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "Removed: include/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# STEP 5: Clean JS (selective)
# =============================================================
Write-Host ""
Write-Host "STEP 5: Cleaning JS..." -ForegroundColor Cyan

# JS folders to remove (not used)
$jsFoldersToRemove = @(
    "modules", "components", "particles"
)

if (Test-Path "js") {
    foreach ($folder in $jsFoldersToRemove) {
        $folderPath = "js\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "Removed: js/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# STEP 6: Clean CSS (selective)
# =============================================================
Write-Host ""
Write-Host "STEP 6: Cleaning CSS..." -ForegroundColor Cyan

# CSS folders to remove (not used)
$cssFoldersToRemove = @(
    "components"
)

if (Test-Path "css") {
    foreach ($folder in $cssFoldersToRemove) {
        $folderPath = "css\$folder"
        if (Test-Path $folderPath) {
            Remove-Item -Recurse -Force $folderPath
            Write-Host "Removed: css/$folder/" -ForegroundColor Green
        }
    }
}

# =============================================================
# FINAL SUMMARY
# =============================================================
Write-Host ""
Write-Host "=== CLEANUP COMPLETED ===" -ForegroundColor Green
Write-Host ""
Write-Host "KEPT files (essential):" -ForegroundColor Yellow
Write-Host "  index.html" -ForegroundColor Green
Write-Host "  style.css" -ForegroundColor Green
Write-Host "  css/font-icons.css" -ForegroundColor Green
Write-Host "  css/swiper.css" -ForegroundColor Green
Write-Host "  css/custom.css" -ForegroundColor Green
Write-Host "  restaurant.css" -ForegroundColor Green
Write-Host "  one-page/css/et-line.css" -ForegroundColor Green
Write-Host "  js/plugins.min.js" -ForegroundColor Green
Write-Host "  js/functions.bundle.js" -ForegroundColor Green
Write-Host "  images/img/ (your images)" -ForegroundColor Green
Write-Host "  images/logo-youme.png" -ForegroundColor Green
Write-Host "  sitemap.xml" -ForegroundColor Green
Write-Host "  robots.txt" -ForegroundColor Green
Write-Host ""
Write-Host "Your website should now be lighter and fully functional!" -ForegroundColor Green 