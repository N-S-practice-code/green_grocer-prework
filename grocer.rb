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
  # puts coupons
  # puts r
  coupons.each do |el|
    k=el[:item]
    if r.keys.include?(k) and r[k][:count] >= el[:num]
      r[k][:count]+=(0-el[:num])
      r[(k+" W/COUPON")]={}
      r[(k+" W/COUPON")][:clearance]=r[k][:clearance]
      r[(k+" W/COUPON")][:price]=el[:cost]
      # puts coupons
      if r[(k+" W/COUPON")].keys.include?(:count)
        r[(k+" W/COUPON")][:count]+=1
      else
        r[(k+" W/COUPON")][:count]=1
      end
      coupons.select{|el2| el2[:item]==k}.size
      # puts r[(k+" W/COUPON")].keys
    end
  end
  # puts r
  r
end

def apply_clearance(cart)
  r=cart
  # puts r
  r.each do |k,v|
    if r[k][:clearance]==true
      r[k][:price]=(r[k][:price]*0.8).round(1)
    end
  end
  r
end

def checkout(cart, coupons)
  r=0
  cart=consolidate_cart(cart)
  r1=apply_coupons(cart, coupons)
  r1=apply_clearance(r1)
  r1.each do |k,v|
    r+=(r1[k][:price]*r1[k][:count]).round(2)
  end
  r=(r*0.9).round(2) if r>100.0
  puts r1 if r==53.0
  r
end
