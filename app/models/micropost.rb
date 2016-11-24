class Micropost < ActiveRecord::Base
  has_many :comments,dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
   mount_uploader :picture, PictureUploader
   validates :user_id, presence: true
   validates :content, presence: true, length: { maximum: 140 }
   validate  :picture_size
    private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    def delete_micropost
    Micropost.find_by(:micropost).destroy
  end

  def feed_comments
    Comment.where("micropost_id = ?", id)
  end
end
