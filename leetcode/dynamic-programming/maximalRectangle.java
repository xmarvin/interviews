class Solution {
    public int maximalRectangle(char[][] matrix) {
        if(matrix == null || matrix.length == 0 || matrix[0].length == 0) return 0;
        int m = matrix.length, n = matrix[0].length;
        int[] accuHeights = new int[n];

        int max = 0;
        for(int i = 0; i < m; i++) {
            for(int j = 0; j < n; j++) {
                accuHeights[j] = matrix[i][j] == '0' ? 0 : accuHeights[j] + 1;
                System.out.println(Arrays.toString(accuHeights));
            }
            max = Math.max(max, maxRectangle(accuHeights));
            System.out.println(maxRectangle(accuHeights));
        }

        return max;
    }

    private int maxRectangle(int[] heights) {
        if(heights == null || heights.length == 0) return 0;
        Deque<Integer> stack = new LinkedList<>();
        stack.push(-1);

        int max = 0;
        for(int i = 0; i <= heights.length; i++) {
            int currHeight = i == heights.length ? 0 : heights[i];
            while(stack.peek() != -1 && heights[stack.peek()] > currHeight) {
                int height = heights[stack.pop()];
                max = Math.max(max, height * (i - stack.peek() - 1));
            }
            stack.push(i);
        }
        return max;
    }
}
