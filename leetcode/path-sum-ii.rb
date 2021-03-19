# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Integer[][]}
def path_sum(root, target_sum)
    res = []
    dfs(root, 0, target_sum, [], res)
    res
end

def dfs(root, current_sum, target_sum, current_path, pathes)
    return if root.nil?

    new_value = current_sum+root.val
    new_path = current_path.dup+[root.val]
    if root.left
        dfs(root.left, new_value, target_sum, new_path, pathes)
    end
    if root.right
        dfs(root.right, new_value, target_sum, new_path, pathes)
    end

    if root.left.nil? && root.right.nil?
        if (new_value==target_sum)
          pathes.push(new_path)
        end
    end
end