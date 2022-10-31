class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :get_meeting
  #before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = @meeting.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @user = current_user
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @meeting = Meeting.find(params[:id])
    @user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to meetings_path(@meeting), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to meetings_path(@meeting), notice: "Comment was not created." }
        format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = @meeting.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to meetings_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.permit(:meeting_id, :user_id, :text_comment)
    end

    def get_meeting
      @meeting = Meeting.find(params[:meeting_id])
    end
end
