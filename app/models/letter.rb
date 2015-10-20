class Letter < ActiveRecord::Base

  validates :content, presence: true
  validates :position, uniqueness: true

  scope :queue, -> { order(position: :desc) }
  scope :draft, -> { where(:status => 'draft') }

  state_machine :status, :initial => :draft do
    state :draft, :value => 'draft'
    state :sent, :value => 'sent'

    event :to_send do
      transition :draft => :sent
    end
  end

  def self.for_send
    Letter.draft.queue.last
  end
end
