class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "User " + @user.name + " has been created"
      redirect_to users_path
    else
      flash[:notice] = "Existe un error en los campos ingresados..."
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #complete this method
    if @user.update_attributes(user_params)
       flash[:notice] = "User " + @user.name + " has been updated"
       redirect_to users_path
    else
       flash[:notice] = "Existe un error en los campos ingresados..."
       render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
    @user.delete
    flash[:notice] = "User " + @user.name + " has been deleted."
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
