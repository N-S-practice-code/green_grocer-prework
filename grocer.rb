def consolidate_cart(cart)
  r={}
  cart.each do |el1|
    if r.keys.include?(el1.keys[0])
      r[el1.keys[0]][:count]+=1
    else
      r[[el1.keys[0]]]=el1[el1.keys[0]]
      r[el1.keys[0]][:count]=1
    end
  end
  r
end

def apply_coupons(cart, coupons)
  r=cart
  coupons.each do |el1|
    if r.keys.include?(el1.keys[0])
      r[el1.keys[0]][:count]+=(0-el1[el1.keys[0]][:num])
      r[(el1.keys[0]+"")]
    end
  end
  r
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
