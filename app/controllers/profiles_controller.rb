class ProfilesController < ApplicationController
  before_filter :load_user
  # GET /profiles
  # GET /profiles.json
  def index
   redirect_to store_url
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = @user.profile

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = @user.build_profile

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = @user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = @user.profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profile, :notice => 'Profile was successfully created.' }
        format.json { render :json => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
   
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = @user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, :notice => 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = @user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
   protected
    def load_user
      @user =User.find(params[:user_id])
    end
end
