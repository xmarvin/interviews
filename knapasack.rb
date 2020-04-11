def budgetShopping(n, bundleQuantities, bundleCosts)
    stores_count = bundleQuantities.length
    dp = Array.new(n+1) { 0 }

    for i in 0..n
        for j in 0...stores_count
            if (bundleCosts[j] <= i)
                dp[i] = [dp[i], dp[i - bundleCosts[j]] + bundleQuantities[j]].max
            end
        end
    end
    dp.last
end

def budgetShopping01(n, bundleQuantities, bundleCosts)
  stores_count = bundleQuantities.length
  dp = Array.new(stores_count) { Array.new(n+1) { 0 } }

  for i in 0...stores_count
     for j in 1..n
            if (bundleCosts[i] > j)
                dp[i][j] = dp[i-1][j]
              else
                dp[i][j] = [dp[i-1][j], dp[i-1][j - bundleCosts[i]] + bundleQuantities[i]].max
            end
        end
    end
    dp.last.last
end