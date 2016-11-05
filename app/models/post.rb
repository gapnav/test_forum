class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates_length_of :body, maximum: 255
  validate :validate_repeating

  private

  def validate_repeating
    prev_post = Post.where(user: self.user).last
    if prev_post && prev_post.body == self.body
      self.errors[:base] << 'This post repeats your previous one'
    end
  end

end
