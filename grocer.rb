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
end

# [
#     {"AVOCADO" => {:price => 3.00, :clearance => true}},
#     {"KALE" => {:price => 3.00, :clearance => false}},
#     {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
#     {"ALMONDS" => {:price => 9.00, :clearance => false}},
#     {"TEMPEH" => {:price => 3.00, :clearance => true}},
#     {"CHEESE" => {:price => 6.50, :clearance => false}},
#     {"BEER" => {:price => 13.00, :clearance => false}},
#     {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
#     {"BEETS" => {:price => 2.50, :clearance => false}},
#     {"SOY MILK" => {:price => 4.50, :clearance => true}}
# ]

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
