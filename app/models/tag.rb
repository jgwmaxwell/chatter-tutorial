class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def self.process_tags(post_id)
    p = Post.find(post_id)
    p.tag_list.each do |tag|
      t = find_or_initialize_by_content(tag)
      t.posts << p
      t.save
    end
  end

end
