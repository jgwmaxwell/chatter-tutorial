class MentionObserver < ActiveRecord::Observer

  observe Mention

  def after_commit(mention)
    NOTIFY_QUEUE.push(:post_id => mention.post_id, :user_id => mention.user_id)
  end

end
