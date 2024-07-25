class CurrentUserController < ApplicationController
  before_action :verify_user_authorization
  before_action :set_user, only: %i[edit update]

  # GET /current_user/edit
  def edit
  end

  # PATCH/PUT /current_user or /current_user.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to sites_path, notice: "Your profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to new_session_path, notice: "Your account was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:avatar, :email, :password, :password_confirmation)
    end
end