def min_cost_climbing_stairs(cost)
   n = cost.length
   return 0 if n <= 2
   dp = Array.new(n) { 0 }
   dp[0] = cost[0]
   dp[1] = cost[1]
   for i in 2...n
    dp[i] = [dp[i-1],dp[i-2]].min + cost[i]
   end
   [dp[n-1], dp[n-2]].min
end
