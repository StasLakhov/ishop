class Order < ApplicationRecord

  delegate :notify_before, :notify_after,
           :purchase_confirmed, :desired_changed,
           to: :notifier

  attr_reader :notifier

  after_initialize :set_initial_status
  after_initialize do
    @notifier = Notifier.new
  end

  state_machine :state, initial: :desired do

    after_transition on: :purchased do |order|
      order.notify_after
    end

    after_transition :purchased => :confirmed, do: :purchase_confirmed
    after_transition :desired => any, do: :desired_changed

    before_transition on: :purchased, do: :notify_before

    event :purchased do
      transition :desired => :purchased, if: :enough_money?
      transition :purchased => :confirmed
      transition :confirmed => same
    end

    event :requested do
      transition :desired => :requesting
    end

    state :desired, :requesting do
      def deliverable?
        false
      end
    end

    state :purchased, :confirmed do
      def deliverable?
        true
      end
    end
  end

  private

  def set_initial_status
    self.state ||= :desired
  end

  def enough_money?
    true
  end

end
