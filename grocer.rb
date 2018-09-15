def consolidate_cart(cart)
  r={}
  cart.each do |el|
    k=el.keys[0]
    if r.keys.include?(k)
      r[k][:count]+=1
    else
      r[k]=el[k]
      r[k][:count]=1
    end
  end
  r
end

def apply_coupons(cart, coupons)
  r=cart
  puts r
  coupons.each do |el|
    k=el[:item]
    if r.keys.include?(k)
      r[k][:count]+=(0-el[:num])
      r[(k+" W/COUPON")][:clearance]=r[k][:clearance]
      r[(k+" W/COUPON")][:price]=el[:cost]
      r[(k+" W/COUPON")][:count]=1
    end
  end
  puts r
  r
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
