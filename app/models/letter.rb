class Letter < ActiveRecord::Base
  validates :content, presence: true
  validates :position, uniqueness: true

  before_create :set_position_in_queue_end

  scope :queue, -> { order(position: :desc) }

  state_machine :status, initial: :draft do
    state :draft
    state :sent

    event :to_send do
      transition draft: :sent
    end
  end

  def self.for_send
    Letter.with_status(:draft).queue.last
  end

  def set_position_in_queue_end
    position = Letter.last.position + 1
    position = 1 if Letter.last.nil?
  end
end
