class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
    if image.attached?
      image
    else
      'no_image.png'  # public/images に置いたデフォルト画像
    end
  end
  
end
