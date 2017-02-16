class Url < ActiveRecord::Base

  before_create :generate
  before_update :update

  validates :original_url, presence: true, uniqueness: true, format: { with: /\A(https?:\/\/)/}

  protected
  def generate
    self.short_url =  "http://aice.5/#{(0...4).map { ('a'..'z').to_a[rand(26)] }.join}"
  end

end