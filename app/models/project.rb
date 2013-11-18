class Project < ActiveRecord::Base
  validates_presence_of :name

  before_create :generate_uid

  private

  def generate_uid
    self.uid = SecureRandom.hex(16)
  end
end
