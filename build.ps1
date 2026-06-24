$templatePath = "c:\Users\Admin\Desktop\GRN NEW\template.html"
$template = [IO.File]::ReadAllText($templatePath)

# Read images and convert to Base64
function Get-Base64($path) {
    if (Test-Path $path) {
        $bytes = [IO.File]::ReadAllBytes($path)
        return [Convert]::ToBase64String($bytes)
    }
    return ""
}

# Reloop images
$reloopLogoPath = "c:\Users\Admin\Desktop\GRN NEW\Reloop logo.png"
$reloopLogo = Get-Base64 $reloopLogoPath

$reloopSealPath = "c:\Users\Admin\Desktop\GRN NEW\reloop seal.png"
if (-Not (Test-Path $reloopSealPath)) {
    $reloopSealPath = "c:\Users\Admin\Desktop\GRN NEW\sign.png"
}
$reloopSeal = Get-Base64 $reloopSealPath

# Aatera images
$aateraLogoPath = "c:\Users\Admin\Desktop\GRN NEW\aatera logo.png"
$aateraSealPath = "c:\Users\Admin\Desktop\GRN NEW\aatera seal.png"
$signPath = "c:\Users\Admin\Desktop\GRN NEW\sign.png"

$aateraLogoB64 = Get-Base64 $aateraLogoPath
$aateraSealB64 = Get-Base64 $aateraSealPath
$signB64 = Get-Base64 $signPath

# Generate Aatera GRN
$aateraHtml = $template.Replace("{{COMPANY_NAME}}", "Aatera Loop Battery Recycling L.L.C")
$aateraHtml = $aateraHtml.Replace("{{COMPANY_SHORT}}", "AATERA")
$aateraHtml = $aateraHtml.Replace("{{PHONE}}", "+971 543252882")
$aateraHtml = $aateraHtml.Replace("{{EMAIL}}", "info@aatera.com")
$aateraHtml = $aateraHtml.Replace("{{ADDRESS}}", "Plot # 598-1766 - WH 17, Universal Global DMCC Compound, Dubai Investment Park 1, Dubai, UAE")
$aateraHtml = $aateraHtml.Replace("{{WEBSITE}}", "www.aatera.com")
$aateraHtml = $aateraHtml.Replace("{{TRN}}", "")
$aateraHtml = $aateraHtml.Replace("{{TRN_DISPLAY}}", "none")
$aateraHtml = $aateraHtml.Replace("{{LOGO_B64}}", $aateraLogoB64)
$aateraHtml = $aateraHtml.Replace("{{SEAL_B64}}", $aateraSealB64)
$aateraHtml = $aateraHtml.Replace("{{SEAL_DISPLAY}}", "")
$aateraHtml = $aateraHtml.Replace("{{SIGN_B64}}", $signB64)
$aateraHtml = $aateraHtml.Replace("{{SIGN_DISPLAY}}", "")

[IO.File]::WriteAllText("c:\Users\Admin\Desktop\GRN NEW\aatera_grn.html", $aateraHtml)
Write-Host "Generated aatera_grn.html"

# Generate Reloop GRN
$reloopHtml = $template.Replace("{{COMPANY_NAME}}", "Reloop Recycling FZE")
$reloopHtml = $reloopHtml.Replace("{{COMPANY_SHORT}}", "RELOOP")
$reloopHtml = $reloopHtml.Replace("{{PHONE}}", "+971 543252882")
$reloopHtml = $reloopHtml.Replace("{{EMAIL}}", "info@reloopglobal.com")
$reloopHtml = $reloopHtml.Replace("{{ADDRESS}}", "RA08 TC05, JAFZA, Dubai, UAE")
$reloopHtml = $reloopHtml.Replace("{{WEBSITE}}", "www.reloopglobal.com")
$reloopHtml = $reloopHtml.Replace("{{TRN}}", "105170462300003")
$reloopHtml = $reloopHtml.Replace("{{TRN_DISPLAY}}", "block")
$reloopHtml = $reloopHtml.Replace("{{LOGO_B64}}", $reloopLogo)
$reloopHtml = $reloopHtml.Replace("{{SEAL_B64}}", $reloopSeal)
$reloopHtml = $reloopHtml.Replace("{{SEAL_DISPLAY}}", "")
$reloopHtml = $reloopHtml.Replace("{{SIGN_B64}}", $signB64)
$reloopHtml = $reloopHtml.Replace("{{SIGN_DISPLAY}}", "")

[IO.File]::WriteAllText("c:\Users\Admin\Desktop\GRN NEW\reloop_grn.html", $reloopHtml)
Write-Host "Generated reloop_grn.html"
