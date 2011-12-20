class Notify

  def self.deliver_message_to_user(params)
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    user.channel ||= Channel.new(
      :channel_ident =>
          Digest::SHA1.hexdigest(user.username, user.created_at.to_s))
    PUBNUB.publish({
      'channel' => user.channel.channel_ident,
      'message' => post.to_json(:include => :user)
    })
  end

end
