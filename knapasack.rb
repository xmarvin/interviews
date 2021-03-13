def budgetShopping(n, prices, weights)
    stores_count = prices.length
    dp = Array.new(n+1) { 0 }
    for i in 1..n
        for j in 0...stores_count
            if (weights[j] <= i)
                dp[i] = [dp[i], dp[i - weights[j]] + prices[j]].max
            end
        end
    end
    dp.last
end

def budgetShopping01(n, prices, weights)
  items_count = prices.length
  weights.insert(0,0)
  prices.insert(0,0)
  dp = Array.new(items_count+1) { Array.new(n+1) { 0 } }

  for i in 1..items_count
     last_item = dp[i-1]
     for j in 1..n
          dp[i][j] = if (weights[i] > j)
              last_item[j]
            else
              [last_item[j], last_item[j - weights[i]] + prices[i]].max
          end
        end
    end
    dp.last.last
end




p budgetShopping01(3, [15,25,35], [1,2,3])