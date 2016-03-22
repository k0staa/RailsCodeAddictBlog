class ArticleTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :article
  validates_presence_of :article_id, :tag_id
  accepts_nested_attributes_for :tag, :reject_if => :all_blank

end
