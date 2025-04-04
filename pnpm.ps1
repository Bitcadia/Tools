param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

if ($Arguments -and $Arguments[0] -eq "dlx") {
    if ($Arguments.Count -ge 2 -and $Arguments[1] -eq "--version") {
        bunx --version
    } else {
        # Create a new array with arguments starting from the second one
        $bunxArgs = $Arguments[1..($Arguments.Length - 1)]
        bunx @bunxArgs
    }
} else {
    & "$PSScriptRoot\pnpmreal.ps1" @Arguments
}
