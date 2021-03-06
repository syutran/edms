class CategoriesController < ApplicationController
  # before_action current_user.status == 99 # 只允许管理员进入
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where("branch_id = ? and level = 0", current_user.group_id)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    @parent_categories = Category.where(:branch_id => current_user.branch.id, :level => 0).collect{|c|[c.name,c.id]}
    @parent_categories << ["顶级类",0]
    @category.branch_id = current_user.branch.id
  end

  # GET /categories/1/edit
  def edit
    selfid = Category.find(params[:id])
    @parent_categories = Category.where("branch_id = ? and level = 0 and id <> ? ",current_user.branch.id,selfid.id).collect{|c|[c.name,c.id]}
    @parent_categories << ["顶级类",0]
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :explain, :level, :parent_id, :branch_id)
    end
end
