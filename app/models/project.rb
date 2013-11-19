class Project < ActiveRecord::Base
  has_many :triggers, dependent: :destroy

  validates_presence_of :name

  before_create :generate_uid

  def to_param
    uid
  end

  private

  def generate_uid
    self.uid = SecureRandom.hex(16)
  end
end
