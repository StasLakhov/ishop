class Notifier

  def notify_before(transion)
    # puts "Notify before"
  end

  def notify_after
    # puts "Notified after"
  end

  def purchase_confirmed(transiotion)
    # puts "Confirmed"
  end

  def desired_changed(transition)
    puts "Desired changed"
  end

end