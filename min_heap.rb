Node = Struct.new(:key, :val)
class MinHeap
  attr_reader :len, :nodes
  
  def initialize(len)
    @nodes = []
    @len = len
  end
  
  def left(i)
    (i + 1) * 2 - 1
  end
  
  def right(i)
    (i + 1) * 2
  end
  
  def parent(i)
    return i if i == 0
    
    (i + 1) / 2 - 1
  end
  
  def keys
    @nodes.map(&:key)
  end
  
  def extract_min
    swap(0, -1)
    min = @nodes.pop
    heapify(0)
    min
  end
  
  def heapify(i)
    min = i
    min = left(i) if left(i) < @nodes.length && @nodes[left(i)].val < @nodes[min].val 
    min = right(i) if right(i) < @nodes.length && @nodes[right(i)].val < @nodes[min].val

    if min != i
      swap(i, min)
      heapify(min)
    end
  end
  
  def decrease_key(i, val)
    raise "#{val} is smaller" if @nodes[i].val < val
    
    @nodes[i].val = val
    while @nodes[i].val < @nodes[parent(i)].val
      swap(i, parent(i))
      i = parent(i)
    end
  end
  
  def add(k, v)
    if @nodes.length == len
      if @nodes[0].val >= v
        return
      else
        extract_min 
      end
    end
    
    @nodes << Node.new(k, Float::MAX)
    decrease_key(@nodes.length - 1, v)
  end
  
  def swap(i, j)
    @nodes[i], @nodes[j] = @nodes[j], @nodes[i]
  end
end
