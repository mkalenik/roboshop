class Order < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries

  belongs_to :shipping_type
  has_many :line_items
  has_many :transitions, class_name: "OrderTransition", autosave: false
  has_one :adress
  

  delegate :can_transition_to?, :current_state, :transition_to!, :transition_to, to: :state_machine

  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition, association_name: :transitions)
  end

  def full_cost
    line_items.map { |e| e.full_price }.sum + shipping_cost
  end

  def self.transition_class
    OrderTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end

  def self.transition_name
    :transitions
  end
end
