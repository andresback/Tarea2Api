class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :error_not_found


  # GET /users
  def index
    @users = User.all

    render json: {'usuarios': @users.as_json, 'total': @users.count()}, status: 200
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {'error': 'la modificacion ha fallado'}, status: 500
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def error_not_found
      render json: {'error': 'usuario no encontrado'}, status: 404
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:nombre, :apellido, :usuario, :twitter)
    end
end
