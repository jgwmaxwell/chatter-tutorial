class PostObserver < ActiveRecord::Observer
  observe Post

  def after_commit(post)
    puts post
    TAG_PROCESSOR.push(:post_id => post.id)
    users = User.find_all_by_username(detect_usernames(post.body))
    if users
      users.each do |u|
        u.mentioned_ins << post
      end
    end
  end


  private
  def detect_usernames(post)
    post.scan(/\B@(\w*[A-Za-z0-9_]+\w*)/).flatten
  end
end
