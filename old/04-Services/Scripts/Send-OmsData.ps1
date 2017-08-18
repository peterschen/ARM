function New-AuthorizationHeader
{
    param
    (
        [string] $CustomerId,
        [string] $SharedKey,
        [string] $Date,
        [string] $ContentLength,
        [string] $ContentType,
        [string] $Method,
        [string] $Resource        
    );
    
    process
    {
        $xHeaders = "x-ms-date:{0}" -f $Date;
        $stringToHash = "{0}`n{1}`n{2}`n{3}`n{4}" -f $Method, $ContentLength, $ContentType, $xHeaders, $Resource;

        $bytesToHash = [Text.Encoding]::UTF8.GetBytes($stringToHash);
        $keyBytes = [Convert]::FromBase64String($SharedKey);

        $sha256 = New-Object System.Security.Cryptography.HMACSHA256;
        $sha256.Key = $keyBytes;
        $calculatedHash = $sha256.ComputeHash($bytesToHash);
        $encodedHash = [Convert]::ToBase64String($calculatedHash);
        $authorization = 'SharedKey {0}:{1}' -f $customerId, $encodedHash;
        
        return $authorization;
    };
}

function Send-OmsData
{
    param
    (
        [string] $CustomerId,
        [string] $SharedKey,
        [string] $Body,
        [string] $LogType,
        [string] $TimeStamp
    );

    process
    {
        $encodedBody = [System.Text.Encoding]::UTF8.GetBytes($body);

        $date = [DateTime]::UtcNow.ToString("r");
        $contentType = "application/json";
        $contentLength = $encodedBody.Length;
        $method = "POST";
        $resource = "/api/logs"
        $authorizationHeader = New-AuthorizationHeader -CustomerId $customerId -SharedKey $sharedKey -Date $date `
            -ContentLength $contentLength -ContentType $contentType -Method $method -Resource $resource;
        
        $uri = "https://{0}.ods.opinsights.azure.com{1}?api-version=2016-04-01" -f $customerId, $resource;

        $headers = @{
            "Authorization" = $authorizationHeader;
            "Log-Type" = $LogType;
            "x-ms-date" = $date;
            "time-generated-field" = $TimeStamp;
        }

        $response = Invoke-WebRequest -Uri $uri -Method $method -ContentType $contentType -Headers $headers -Body $encodedBody -UseBasicParsing;
        return $response.StatusCode;
    };
}

<#
    # Replace with your Workspace ID
    $CustomerId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  

    # Replace with your Primary Key
    $SharedKey = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

    # Specify the name of the record type that you'll be creating
    $LogType = "MyRecordType"

    # Specify a time in the format YYYY-MM-DDThh:mm:ssZ to specify a created time for the records
    $TimeStampField = ""

    # Create two records with the same set of properties to create
    $json = @"
    [{  "StringValue": "MyString1",
        "NumberValue": 42,
        "BooleanValue": true,
        "DateValue": "2016-05-12T20:00:00.625Z",
        "GUIDValue": "9909ED01-A74C-4874-8ABF-D2678E3AE23D"
    },
    {   "StringValue": "MyString2",
        "NumberValue": 43,
        "BooleanValue": false,
        "DateValue": "2016-05-12T20:00:00.625Z",
        "GUIDValue": "8809ED01-A74C-4874-8ABF-D2678E3AE23D"
    }]
    "@

$json = @"
[{
    "TrackingId": "$([guid]::NewGuid())",
    "TimeStampMilis": "$(([datetime]::UtcNow - [datetime]::Parse("1.1.1970")).TotalMilliseconds)",
    "TimeStampZulu": "$(Get-Date -Format "yyyy:mm:ddThh:mm:ss.msZ")"
}]
"@

    # Create the function to create and post the request
    Send-OmsData -CustomerId $CustomerId -SharedKey $SharedKey -Body ([System.Text.Encoding]::UTF8.GetBytes($json)) -LogType $LogType;
#>