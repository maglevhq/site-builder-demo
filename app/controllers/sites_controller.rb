class SitesController < ApplicationController
  before_action :verify_user_authorization
  before_action :set_site, only: %i[edit update destroy ]

  # GET /sites or /sites.json
  def index
    @sites = sites
  end

  # GET /sites/new
  def new
    @site = sites.build(theme_id: Theme.first.id)
    @themes = Theme.all
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @site = sites.build(site_params)
    @themes = Theme.all

    respond_to do |format|
      if @site.save_and_create_maglev_site
        format.html { redirect_to sites_url, notice: "Site was successfully created." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to sites_url, notice: "Site was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy!

    respond_to do |format|
      format.html { redirect_to sites_url, notice: "Site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def sites
      current_user.sites.order(created_at: :desc)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = sites.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:name, :domain, :theme_id).tap do |safe_params|
        safe_params[:domain] = nil if safe_params[:domain].blank?
      end
    end
end
