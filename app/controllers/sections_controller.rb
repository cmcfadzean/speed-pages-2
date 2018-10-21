class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you get all the comments of this post
    @sections = page.sections
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you retrieve the comment thanks to params[:id]
    @section = page.sections.find(params[:id])
  end

  # GET /sections/new
  def new
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you build a new one
    @section = page.sections.build
  end

  # GET /sections/1/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you retrieve the comment thanks to params[:id]
    @section = page.sections.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you create the comment with arguments in params[:comment]
    @section = page.sections.create(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to [@section.page, @section], notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: [@section.page, @section] }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you retrieve the comment thanks to params[:id]
    @section = page.sections.find(params[:id])

    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to [@section.page, @section], notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: [@section.page, @section] }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    #1st you retrieve the post thanks to params[:post_id]
    page = Page.find(params[:page_id])
    #2nd you retrieve the comment thanks to params[:id]
    @section = page.sections.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(page_sections_url) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:title, :section_type, :page_id)
    end
end
