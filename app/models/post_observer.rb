class PostObserver < ActiveRecord::Observer
  observe Post

  def after_commit(post)
    TAG_PROCESSOR.push(:tag_class => Tag, :post_id => post.id)
  end
end
