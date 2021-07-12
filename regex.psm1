set-strictMode -version latest

function select-regex {
    param (
     [parameter(mandatory=$true)]
     [regex] $regex,
   # ----
     [parameter(mandatory         = $true,
                valueFromPipeline = $true)]
     [allowEmptyString()]
     [string] $text
    )

    begin {
       $regex = [regex]::new($regex)
    }

    process {

        $match = $regex.match($text)
        if ($match.success) {
            $match.Groups[0].value
        }
    }

    end {
    }
}
