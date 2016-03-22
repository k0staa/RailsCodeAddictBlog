class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  validates :title, presence: true,
                    length: { minimum: 5 }
 accepts_nested_attributes_for :tags,  allow_destroy: false, reject_if: lambda {|attributes| attributes['name'].blank?}
  def self.search(search, page)
    order('created_at DESC').where('title LIKE ?', "%#{search}%").paginate(page: page, per_page: 2)

  end
end