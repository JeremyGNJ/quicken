<#	
	===========================================================================
	 Created on:   	5/30/2021 9:49 AM
	 Created by:   	Jeremy
	===========================================================================

Creates a CSV of crypto price history suitable to import into quicken.

		1.  Create fake stocks in Quicken with a prefix of "zzz" before the coin name (ie   zzzBTC)
		2.  Create a free account on AlphaVantage (free historical prices)
        	3.  Put your alpha vantage API key below
		4.  Build your Crypto List below 
		5.  "ImportToQuicken.csv" will be saved wherever you ran the command from
#>

#User Variables
$APIKey = "WGCLBCJE2W767IUR"
$CryptoList = "BTC","BCH","XMR","ADA", "BTG", "DASH", "DOGE", "DOT", "ETH", "LTC", "XLM", "XRP"

#Instantiate Arrays
$PriceList = @()

#Download Prices
Foreach ($Crypto in $CryptoList)
{
	#Download prices.  Quicken only tracks daily prices so no need to download more detail than that.
	$CRaw = Invoke-WebRequest "https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=$Crypto&market=CNY&apikey=$APIKey&datatype=csv"
	$CPriceList = ConvertFrom-Csv $CRaw
	#$CPriceList = $CPriceList |select -First 3  #Test with small dataset
	Write-Host "$Crypto - $($CPriceList.count)"
	$CPriceList = $CPriceList | select -Property @{ n = "symbol"; e = { "zzz$Crypto" } }, "close (USD)", @{ Name = 'd2'; expression = { ([datetime]$_.timestamp).toshortdatestring() } }
	$PriceList += $CPriceList
	#Pause betweeen each because API is throttled to 5 per min
	sleep -Seconds 14
}

#Format to Quicken-importable CSV of price histories.
$PriceList | ConvertTo-Csv | % { $_ -replace '"', '' } | Select-Object -Skip 2 | Out-File "ImportToQuicken.csv" -Encoding utf8
