# Miscellaneous scripts
This Repo nests all the small scripts I have written for my personnal use. Feel free to use/improve them.
Be sure to read the script's header as it might depend on some extra packages in some cases.

[crypto.sh](#cryptosh)

[stock.sh](#stocksh)

## Crypto.sh
This script prints info about any cryptocurrency supported by the coinmarketcap.com api.

**Requirements:**

	curl
**USAGE:**

	./crypto.sh [SYMBOL]
**Example:**

    ./crypto.sh XRP
        symbol: XRP 
        rank: 3 
        price_usd: 0.812327 
        price_btc: 0.00009110 
        24h_volume_usd: 1167360000.0 
        market_cap_usd: 31799517968.0 
        available_supply: 39146203398.0 
        total_supply: 99992334929.0 
        max_supply: 100000000000 
        percent_change_1h: 0.88 
        percent_change_24h: -0.63 
        percent_change_7d: 11.63 
        last_updated: 1524747242 
        price_eur: 0.66675394 
        24h_volume_eur: 958163251.2 
        market_cap_eur: 26100885350.0

## Stock.sh
This script prints info about a stock symbol and tries to search it if it doesn't exist. the infos are parsed from marketwatch.com and charting.nasdaq.com for the gnuplot graphs
**Requirements:**

	curl recode gnuplot
**USAGE:**

	./stock.sh [SYMBOL | Company name]

**Example:**

	$> ./stock.sh HCMLY
	STOCK INFO FOR HCMLY:
	
	NAME:        LafargeHolcim Ltd. ADR
	VALUE:       11.06
	MARKET CAP:  $33.46B
	5 Days:      -2.04%                  
	1 Month:     1.33%                   
	3 Months:    -10.88%                 
	YTD:         -1.34%                  
	1 Year:      -3.15%                  
	
	    13 +-++-+-+-+-++-+-++-+-+-++-+-+-++-+-+-++-+-+-++-+-+-+-++-++-+-+-++-+-+   
	       +    +     +    +    +    +    +     +    +    +     +   +     +    +   
	       |                                                                   |   
	12.5 +-+                                                AA             +-+   
	       |                                                 AAA               |   
	       |                     A      AA                   A A               |   
	  12 +-+      AA         AAAAAA  AAA                  A   A            +-+   
	       |        AAA      AAAA AAAAAA                   AA      AA          |   
	       |          AAA AAAA       AA   A A              A      AAA          |   
	11.5 +-+  AA    AAAAAAA        A   AAAAAA                 A A A        +-+   
	       |   AA       AAA                A AAA A        A     AAA            |   
	       |    AAAA                           AAAA A    AA      A    A     AA |   
	       |      AA                            AAAAA    AA          AAAA   A A|   
	  11 +-+   A A                              A AA  AA          A A  AAAA+A+   
	       |                                         AAA                AAAA   |   
	       |                                          AA                       |   
	10.5 +-+                                        AA                     +-+   
	       |                                                                   |   
	       +    +     +    +    +    +    +     +    +    +     +   +     +    +   
	    10 +-++-+-+-+-++-+-++-+-+-++-+-+-++-+-+-++-+-+-++-+-+-+-++-++-+-+-++-+-+   
	      04   05    06   07   08   09   10    11   12   01    02  03    04   05   

---
	$> ./stock.sh total
	Searching symbols for total...

	11 results found:

	Total Access Communication PCL ADR    SYMBOL: TACYY
	Total Energy Services Inc.            SYMBOL: TOTZF
	Total Gabon S.A.                      SYMBOL: ELFGF
	Totally Green Inc.                    SYMBOL: TLGN
	Total Produce PLC                     SYMBOL: TTPPF
	Total S.A. ADR                        SYMBOL: TOT
	Total S.A.                            SYMBOL: TTFNF
	Total Sports Media Inc.               SYMBOL: TSMI
	Total System Services Inc.            SYMBOL: TSS
	Total Telcom Inc.                     SYMBOL: TTLTF
	USAA Total Return Strategy Fund;Fund  SYMBOL: USTRX
