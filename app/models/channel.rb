class Channel < ActiveRecord::Base

  belongs_to :broadcastable, :polymorphic => true

end
