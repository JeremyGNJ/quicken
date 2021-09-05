**Quicken doesnt track Crypto prices.  But it's pretty easy to do so.   Can't help that it isnt capable of 
tracking enough decimal precision, but it's still useful to have an approximation for viewing your crypto 
assets in context with all of your investments.**

# Step 1 - Fake stocks in quicken
  In quicken, create a fake stock for each coin you want to track, but for the Symbol, prefix the 
  coin symbol with "zzz". 

  For example, bitcoin should be:  **zzzBTC**
  
  (this will avoid conflicting with any stocks that currently use the same symbol as a COIN and avoid issues 
  if quicken supports crypto in the future)

## To do this:
1. Investing --> Tools --> Security List --> Add Security
2. At bottom of this window "If the ticker symbol is now found...create manually...**click here**")
3. (I also created a new "Security Type" as well but you dont have to)
      
# Step 2 - A way to get crypto prices
  Create an account on https://www.alphavantage.co  (NOT .com  just .co).  
  On the home page click "Get your free API key"
  
  (its just a site that allows free stock price download for individuals)
    
# Step 3 - Download prices using powershell script
1. Download DownloadCryptoPrices.ps1 from this repo
2. Modify it in notepad (or your favorite editor)
    * Include your API key
    * Include your desired crypto coin symbols
3. Launch powershell and run the script
4. Launch quicken and import historical prices from the CSV file that the script produces
5. If you dont know how to do any of this, sorry.

# Step 4 - Create an account in quicken and "buy" your coins
   If you dont know how to do this, you probably stopped reading a long time ago.
