from okx.MarketData import MarketAPI
marketDataAPI = MarketAPI(flag="0")

def get_tickers_of(instId="ETH-USDT-SWAP"):
    res = marketDataAPI.get_ticker(instId = instId);
    return res

def main():
    price = float(get_tickers_of()['data'][0]['last'])
    print(f"{price:.2f}")

if __name__ == "__main__":
    main()
