param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Arguments
)

# Pass all arguments directly to bunx
bunx @Arguments
