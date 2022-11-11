##
# Returns the best pair of days to buy and sell stocks given an array of stock prices.
def stock_picker(prices)
    # initialize variables
    lowest_price_index, highest_price_index = 0
    optimal_profit = 0

    # loop through and find the best pair of days to buy+sell
    # for every price
    prices.each_with_index do |price1, index1|
        # check the prices that come after it
        prices.drop(index1+1).each_with_index do |price2, index2|
            # if this is the optimal pair so far, store it
            if (price2 - price1) >= optimal_profit
                lowest_price_index = index1
                highest_price_index = index2 + index1 + 1
                optimal_profit = price2 - price1
                #p "found p1:#{price1} at #{index1} p2:#{price2} at #{index2 + index1 + 1}"
            end
        end
    end
    puts "The best return is $#{optimal_profit}!"
    optimal_pair = [lowest_price_index, highest_price_index]
end

p stock_picker([17,3,6,9,15,8,6,1,10])