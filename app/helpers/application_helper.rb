module ApplicationHelper

  def pin_exist?(sneak)
   if current_user && pin = current_user.pins.select {|pin| pin.sneaker == sneak}.last
    pin
  else
   false
  end
  end

  def profile_pic
    if (pic = current_user.profile_pic)
      pic
    else
    'profile_pic_30px.png'
  end
  end

  def home_badges #Homepage Notifications
    all = current_user.homepage_notifications
    newest = all.last(10)
    count = all.where(read: false).count
    return {newest: newest, count: count}
  end

  def on_sale(sneaker)
    if (plp = sneaker.previous_lowest_price) &.> (lp = sneaker.lowest_price)
          sale_p = (lp / plp * 100 - 100).round
      content_tag(:div, "#{sale_p}%",class: "sale")
    end

  end

end
