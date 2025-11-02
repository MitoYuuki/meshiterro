class PostImage < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.png'  # public/images に置いたデフォルト画像
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
