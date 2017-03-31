class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :valid_update, only: [:update]
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
    if params.has_key?(:id)
      render json: {'error': 'no se puede crear usuario con id'}, status: 400
    else
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
  if user_params[:id]
    render json: {'error': 'id no es modificable'}, status: 400
  else
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: {'error': 'la modificacion ha fallado'}, status: 500
    end

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

    def valid_update
      if user_params.count() > 1
        render json: {'error': 'la modificacion ha fallado'}, status: 500
      end
    end

    def error_not_found
      render json: {'error': 'usuario no encontrado'}, status: 404
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :nombre, :apellido, :usuario, :twitter)
    end
end
