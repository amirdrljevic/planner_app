class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show edit update destroy ]
  before_action :is_admin, only: %i[ show edit update destroy ]
  before_action :check_for_comments, only: [:destroy]

  # GET /meetings or /meetings.json
  def index
    if admin?
      @meetings = Meeting.all
    else 
      @meetings = current_user.meetings
    end
  end

  # GET /meetings/1 or /meetings/1.json
  def show
    @comments = @meeting.comments.order(created_at: :desc)
    @comment = @meeting.comments.build
    @comment.user = current_user
  end

  # GET /meetings/new
  def new
    @meeting = current_user.meetings.build
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings or /meetings.json
  def create
    
    @meeting = current_user.meetings.build(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_url(@meeting), notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1 or /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to meeting_url(@meeting), notice: "Meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1 or /meetings/1.json
  def destroy
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url, notice: "Meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:user_id, :title, :description, :meeting_date, :meeting_time, :meeting_place, :status, :tags, images: [])
    end

    def admin?
      current_user.role.role_name == 'ADMIN'
    end

    def is_admin
       
      if !owner? && !admin?
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Restricted access. You are not an administrator." }
          format.json { head :no_content }      
        end
      end
    end

    def owner?
      @meeting = Meeting.find(params[:id])
      current_user.id == @meeting.user_id 
    end

    def check_for_comments
      if @meeting.comments.any?
        respond_to do |format|
          format.html { redirect_to @meeting, notice: "Meeting has comments. Cannot delete." }
          format.json { head :no_content }      
        end
      end
    end
end
