require './testJan31st.rb'

describe "Reopen array class" do

  it "should return a string" do
	fred = Array.new
      expect(fred.bollocks).to eq('bollocks to you')
  end	
end

describe "subclass array class" do

  it "should again return a string" do
    george = Bill.new
    expect(george.henry).to eq('No more swearing, please')
  end	
end

# ============================ Inject method rewrite

describe "Inject: no block or array" do

    it "should give back nil value" do
    expect([].inj{}).to eq([].inject{})
	end	
end

describe "Inject: array but no block" do

    it "should give back the argument" do
    expect(['aaa'].inj{}).to eq(['aaa'].inject{})
	end	
end

describe "Inject: basic string" do

    it "should return longest from a string" do
	  
    expect(['cat', 'sheep', 'bear'].inj{|memo,word| 
    	memo.length > word.length ? memo : word
    	}).to eq(['cat', 'sheep', 'bear'].inject{|memo,word| 
      memo.length > word.length ? memo : word
      })
	end
end

describe "Inject: basic numbers" do

    it "should return numbers summed" do
	  
    expect([1,4,8,10].inj{|memo,number| memo + number }).to eq(23)

  
  # Trying to put the same test wwith 'inject' into expect gives:
  # ArgumentError:
  #    The expect syntax does not support operator matchers, so you must pass a matcher to `#to`.
	end		
end

describe "Inject: basic strings" do

    it "should return strings concatenated, same block as basic numbers" do
	  
    expect(['a','b','c'].inj{|memo,number| memo + number }).to eq('abc')
	end		
end

describe "Inject: arrays" do

    it "should return something or other" do
   

  #  Again expect fails in a way I fail to understand    

  #  expect([['a','b'],['c','d','e']].inj{|memo,number| memo }).to 
  #      eq([['a','b'],['c','d','e']].inject{|memo,number| memo })
  end   
end

describe "Inject: Pass a hash not an array" do

    it "raise error, method not implemented" do
	  
    expect{{1 =>1, 2 => 2}.inj{|memo,number| memo + number }}.to raise_error(NoMethodError)

	end		
end