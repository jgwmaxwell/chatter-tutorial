TAG_PROCESSOR = GirlFriday::WorkQueue.new(:post_process, :size => 2) do |msg|
  Tag.process_tags(msg[:post_id])
end

NOTIFY_QUEUE = GirlFriday::WorkQueue.new(:post_process, :size => 2) do |msg|
  Notify.deliver_message_to_user(msg)
end
