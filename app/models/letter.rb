class Letter < ActiveRecord::Base
  validates :content, presence: true
  validates :position, uniqueness: true

  scope :queue, -> { order(position: :desc) }

  state_machine :status, initial: :draft do
    state :draft
    state :sent

    event :to_send do
      transition draft: :sent
    end
  end

  def self.for_send
    Letter.with_state(:draft).queue.last
  end
end
