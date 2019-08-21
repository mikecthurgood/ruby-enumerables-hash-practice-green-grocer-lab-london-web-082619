require "pry"

def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |shopping|
   shopping.each do |item, item_details|
     if consolidated_cart.keys.include?(item)
       consolidated_cart[item][:count] += 1
     else
       consolidated_cart[item] = item_details
       consolidated_cart[item][:count] = 1
     end
   end
  end
   consolidated_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
     item = coupon[:item]
     if cart[item] && cart[item][:count] >= coupon[:num]  

        if cart["#{item} W/COUPON"]
          cart["#{item} W/COUPON"][:count] += coupon[:num]

        else 
           cart["#{item} W/COUPON"] = { 
             price: coupon[:cost] / coupon[:num],
             clearance: cart[item][:clearance],
             count: coupon[:num]
           }
       end
       cart[item][:count] -= coupon[:num]
     end
   end
   cart
end



def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] === true
      details[:price] = (details[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  applied_coupons = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(applied_coupons)
  
  cart_total = 0

  final_cart.each do |item_name, value|
    cart_total += value[:price] * value[:count]
  end
  
  cart_total > 100 ? cart_total * 0.9 : cart_total
  
end
