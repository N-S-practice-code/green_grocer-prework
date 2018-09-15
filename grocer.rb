def consolidate_cart(cart)
  r={}
  cart.each do |el1|
    if r.keys.include?(el1.keys[0])
      r[el1.keys[0]][:count]+=1
    else
      
    end
  end
  r
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
