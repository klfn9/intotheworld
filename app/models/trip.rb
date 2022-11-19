class Trip < ApplicationRecord

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  # アソシエーション
  belongs_to :user
  has_many :trip_comments, dependent: :destroy
  has_many :trip_tags, dependent: :destroy
  has_many :tags, through: :trip_tags
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}


  # 星評価
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  # 検索
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
