module MyEnumerable
  def my_each
  	for i in self
  	  yield i
  	end
  end

  def my_each_with_index(index = 0)
  	for i in self
  	  yield i, index
  	  index += 1
  	end
  end

  def my_select(return_array = [])
  	for i in self
  	  if yield i
  		return_array << i
  		end
  	end
  	return return_array
  end

  def my_all
  	for i in self
  	  if not yield i
  	    return false
  		end
  	end
  	return true
  end

  def my_any
  	for i in self
  	  if yield i
  		return true
  		end
  	end
  	return false
  end

  def my_none
  	for i in self
  	  if yield i
  		return false
  		end
  	end
  	return true
  end

  def my_count(a = nil, &block)
  	n = 0
  	if a == nil && !(block_given?)
  	  for i in self
  	  	n += 1
  	  end
  	elsif a == nil && block_given?
  	  for i in self
  	  	if yield i
  	      n += 1
  	    end
  	  end
    else
      for i in self
        if a == yield(i)
          n += 1
        end
      end
  	end
    return n
  end

  def my_map
  	new_array = []
    if block_given?
  	 for i in self
  	   if yield i
        new_array << (yield i)
        end
  	 end
    end
  	return new_array
  end

  def my_inject(memo = 0, some_method)
  	i = 0
  	while i < self.size
  		memo += some_method.call(self[i])
  		i += 1
  	end
  	self
  end

  def my_map_mod(proc=nil, &block)
  	new_array = []
  	for i in self
  		if proc and block_given?
  			new_array << block.call(proc.call(i))
  		elsif !block_given?
  			new_array << proc.call(i)
  		else
  			new_array << yield(i)
  		end
  	end

  	new_array
  end
end