class PostsController < ApplicationController

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.build(params)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    params[:post][:ip_address] = request.ip
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url,
                      notice: 'Post was successfully created.' }
        format.json { render json: @post,
                      status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
