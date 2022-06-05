class ResumesController < ApplicationController
  before_action :set_resume, only: %i[ show edit update destroy ]

  # GET /resumes or /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1 or /resumes/1.json
  def show
    extension=@resume.title.split('.')
     send_file Rails.root.join('public', 'uploads',@resume.title), :type=>"application/#{extension[1]}", :x_sendfile=>true
  end

  # GET /resumes/new
  def new
    @resume = Resume.new

  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes or /resumes.json
  def create
    @resume = Resume.new(resume_params)

    #save file to server
    uploaded_io = params[:resume][:title]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
   @resume.title=uploaded_io.original_filename

    respond_to do |format|
      if @resume.save
        format.html { redirect_to resume_url(@resume), notice: "Resume was successfully created." }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1 or /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to resume_url(@resume), notice: "Resume was successfully updated." }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1 or /resumes/1.json
  def destroy
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url, notice: "Resume was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resume_params
      params.require(:resume).permit(:cover_letter, :title)
    end
end
