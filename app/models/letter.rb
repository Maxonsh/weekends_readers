class Letter < ActiveRecord::Base

  validates :content, presence: true
  validates :position, uniqueness: true

  scope :queue, -> { order(position: :desc) }

  def self.for_send
    Letter.where(:status => '').queue.last
  end
end
