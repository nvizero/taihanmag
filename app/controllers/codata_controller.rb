class CodataController < ApplicationController
  before_action :set_codatum, only: [:show, :edit, :update, :destroy]
  # before_action :set_footer, only: [:show, :edit, :update, :destroy ,:edit_slug]
  before_action :set_title

  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin  # 再檢查是否有權限
  helper_method :sort_column, :sort_direction

  layout "bootstrap"

  # GET /codata
  # GET /codata.json
  def index
    @codata = Codatum.all
  end

  # GET /codata/1
  # GET /codata/1.json
  def show
  end

  # GET /codata/new
  def new
    @codatum = Codatum.new
  end

  # GET /codata/1/edit
  def edit
    @notice = params[:notice]
  end

  # POST /codata
  # POST /codata.json
  def create
    @codatum = Codatum.new(codatum_params)

    respond_to do |format|
      if @codatum.save
        format.html { redirect_to @codatum, notice: 'Codatum was successfully created.' }
        format.json { render :show, status: :created, location: @codatum }
      else
        format.html { render :new }
        format.json { render json: @codatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codata/1
  # PATCH/PUT /codata/1.json
  def update
    # respond_to do |format|
      if @codatum.update(codatum_params)
        # format.html { 
          # redirect_to @codatum, notice: 'Codatum was successfully updated.' 
          # redirect_to :action => 'edit' @codatum.id
          redirect_to action: "edit", id: @codatum.id , notice: '更新成功！' 
        # }
        # format.json { render :show, status: :ok, location: @codatum }
      else
        # format.html { 
          render :edit 
        # }
        # format.json { render json: @codatum.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /codata/1
  # DELETE /codata/1.json
  def destroy
    @codatum.destroy
    respond_to do |format|
      format.html { redirect_to codata_url, notice: 'Codatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_title
      @active = "footers"
      @title = ["公司基本設定",""]
    end

    def sort_column
      Codatum.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_codatum
      @codatum = Codatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codatum_params
      params.require(:codatum).permit(:tel, :fax, :email ,:address_en , :address)
    end
end
