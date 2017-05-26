class Item < ApplicationRecord
  belongs_to :user
  default_scope { order('created_at ASC') }
  scope :uncompleted, -> { where("completed IS NULL or completed = ?", false)}
  scope :completed, -> { where(completed: true)}

  def avatar_url(size)
   gravatar_id = Digest::MD5::hexdigest(self.email).downcase
   "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
